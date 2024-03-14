cdef extern from "<math.h>" nogil:
    const double M_E
    const double e "M_E"  # as in Python's math module
    const double M_LOG2E
    const double M_LOG10E
    const double M_LN2
    const double M_LN10
    const double M_PI
    const double pi "M_PI"  # as in Python's math module
    const double M_PI_2
    const double M_PI_4
    const double M_1_PI
    const double M_2_PI
    const double M_2_SQRTPI
    const double M_SQRT2
    const double M_SQRT1_2

    # C99 constants
    const float INFINITY
    const float NAN
    # note: not providing "nan" and "inf" aliases here as nan() is a function in C
    const double HUGE_VAL
    const float HUGE_VALF
    const long double HUGE_VALL

    # All C99 functions in alphabetical order
    double acos(double x)
    float acosf(float)
    double acosh(double x)
    float acoshf(float)
    long double acoshl(long double)
    long double acosl(long double)
    double asin(double x)
    float asinf(float)
    double asinh(double x)
    float asinhf(float)
    long double asinhl(long double)
    long double asinl(long double)
    double atan(double x)
    double atan2(double y, double x)
    float atan2f(float, float)
    long double atan2l(long double, long double)
    float atanf(float)
    double atanh(double x)
    float atanhf(float)
    long double atanhl(long double)
    long double atanl(long double)
    double cbrt(double x)
    float cbrtf(float)
    long double cbrtl(long double)
    double ceil(double x)
    float ceilf(float)
    long double ceill(long double)
    double copysign(double, double)
    float copysignf(float, float)
    long double copysignl(long double, long double)
    double cos(double x)
    float cosf(float)
    double cosh(double x)
    float coshf(float)
    long double coshl(long double)
    long double cosl(long double)
    double erf(double)
    double erfc(double)
    float erfcf(float)
    long double erfcl(long double)
    float erff(float)
    long double erfl(long double)
    double exp(double x)
    double exp2(double x)
    float exp2f(float)
    long double exp2l(long double)
    float expf(float)
    long double expl(long double)
    double expm1(double x)
    float expm1f(float)
    long double expm1l(long double)
    double fabs(double x)
    float fabsf(float)
    long double fabsl(long double)
    double fdim(double x, double y)
    float fdimf(float, float)
    long double fdiml(long double, long double)
    double floor(double x)
    float floorf(float)
    long double floorl(long double)
    double fma(double x, double y, double z)
    float fmaf(float, float, float)
    long double fmal(long double, long double, long double)
    double fmax(double x, double y)
    float fmaxf(float, float)
    long double fmaxl(long double, long double)
    double fmin(double x, double y)
    float fminf(float, float)
    long double fminl(long double, long double)
    double fmod(double x, double y)
    float fmodf(float, float)
    long double fmodl(long double, long double)
    double frexp(double x, int* exponent)
    float frexpf(float, int* exponent)
    long double frexpl(long double, int*)
    double hypot(double x, double y)
    float hypotf(float, float)
    long double hypotl(long double, long double)
    int ilogb(double x)
    int ilogbf(float)
    int ilogbl(long double)
    double ldexp(double x, int exponent)
    float ldexpf(float, int exponent)
    long double ldexpl(long double, int exponent)
    double lgamma(double x)
    float lgammaf(float)
    long double lgammal(long double)
    long long llrint(double)
    long long llrintf(float)
    long long llrintl(long double)
    long long llround(double)
    long long llroundf(float)
    long long llroundl(long double)
    double log(double x)
    double log10(double x)
    float log10f(float)
    long double log10l(long double)
    double log1p(double x)
    float log1pf(float)
    long double log1pl(long double)
    double log2(double x)
    float log2f(float)
    long double log2l(long double)
    double logb(double x)
    float logbf(float)
    long double logbl(long double)
    float logf(float)
    long double logl(long double)
    long lrint(double)
    long lrintf(float)
    long lrintl(long double)
    long lround(double)
    long lroundf(float)
    long lroundl(long double)
    double modf(double x, double* iptr)
    float modff(float, float* iptr)
    long double modfl(long double, long double* iptr)
    double nan(const char*)
    float nanf(const char*)
    long double nanl(const char*)
    double nearbyint(double x)
    float nearbyintf(float)
    long double nearbyintl(long double)
    double nextafter(double, double)
    float nextafterf(float, float)
    long double nextafterl(long double, long double)
    double nexttoward(double, long double)
    float nexttowardf(float, long double)
    long double nexttowardl(long double, long double)
    double pow(double x, double y)
    float powf(float, float)
    long double powl(long double, long double)
    double remainder(double x, double y)
    float remainderf(float, float)
    long double remainderl(long double, long double)
    double remquo(double x, double y, int* quot)
    float remquof(float, float, int* quot)
    long double remquol(long double, long double, int* quot)
    double rint(double x)
    float rintf(float)
    long double rintl(long double)
    double round(double x)
    float roundf(float)
    long double roundl(long double)
    double scalbln(double x, long n)
    float scalblnf(float, long)
    long double scalblnl(long double, long)
    double scalbn(double x, int n)
    float scalbnf(float, int)
    long double scalbnl(long double, int)
    double sin(double x)
    float sinf(float)
    double sinh(double x)
    float sinhf(float)
    long double sinhl(long double)
    long double sinl(long double)
    double sqrt(double x)
    float sqrtf(float)
    long double sqrtl(long double)
    double tan(double x)
    float tanf(float)
    double tanh(double x)
    float tanhf(float)
    long double tanhl(long double)
    long double tanl(long double)
    double tgamma(double x)
    float tgammaf(float)
    long double tgammal(long double)
    double trunc(double x)
    float truncf(float)
    long double truncl(long double)

    int isinf(long double)   # -1 / 0 / 1
    bint isfinite(long double)
    bint isnan(long double)
    bint isnormal(long double)
    bint signbit(long double)
    int fpclassify(long double)
    const int FP_NAN
    const int FP_INFINITE
    const int FP_ZERO
    const int FP_SUBNORMAL
    const int FP_NORMAL