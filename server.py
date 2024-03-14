import subprocess
import os
import tempfile
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import StreamingResponse
from fastapi.responses import Response
import asyncio
import logging
from PIL import Image
import io

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger("uvicorn")

app = FastAPI()

BASE_PATH = "D:/Projects_Data/Github/NAFNet"
BASICSR_PATH = ("D:/Projects_Data/Github/NAFNet/basicsr")
DEMO_SCRIPT_PATH = BASICSR_PATH + "/demo.py"
CONFIG_PATH = BASE_PATH + "/options/test/SIDD/NAFNet-width64.yml"
    
def unblur_image(content):
    image = Image.open(io.BytesIO(content))
    
    directory = "./demo_input/"
    os.makedirs(directory, exist_ok=True)
    
    with tempfile.NamedTemporaryFile(suffix=".jpg", dir=directory, delete=False) as temp_input_file:
        temp_input_path = temp_input_file.name
        image.save(temp_input_path, format='JPEG')
        logger.info(f"Temporary input file created: {temp_input_path}")

    with tempfile.NamedTemporaryFile(suffix=".png", dir=directory, delete=False) as temp_output_file:
        temp_output_path = temp_output_file.name
        logger.info(f"Temporary output file created: {temp_output_path}")
        
    command = f"python basicsr/demo.py -opt options/test/REDS/NAFNet-width64.yml --input_path {temp_input_path} --output_path {temp_output_path}"
    logger.info(f"Executing command: {command}")
    try:
        subprocess.run(command, shell=True, check=True)
        logger.info("Image processing completed successfully.")
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Error processing image: {e}")

    with open(temp_output_path, "rb") as f:
        output_content = f.read()
        logger.info("Output image file read successfully.")

    os.remove(temp_input_path)
    os.remove(temp_output_path)
    logger.info("Temporary input and output files removed.")

    return output_content

async def process_file(content):
    loop = asyncio.get_event_loop()
    return await loop.run_in_executor(None, unblur_image, content)

@app.post("/unblur-image/")
async def upload_file(file: UploadFile = File(...)):
    try:
        content = await file.read()
        logger.info("File read successfully.")
        output_content = await process_file(content)
        image_size = len(output_content)
        headers = {"Content-Length": str(image_size)}
        logger.info(f"Returning the processed image of size: {image_size}")
        return Response(content=output_content, media_type="image/png", headers=headers)
    except Exception as e:
        logger.error(f"An error occurred: {e}")
        raise HTTPException(status_code=500, detail=str(e))
