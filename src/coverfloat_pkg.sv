package coverfloat_pkg;

    const logic [31:0] FLAG_INEXACT_MASK   =  32'd1;
    const logic [31:0] FLAG_UNDERFLOW_MASK =  32'd2;
    const logic [31:0] FLAG_OVERFLOW_MASK  =  32'd4;
    const logic [31:0] FLAG_INFINITE_MASK  =  32'd8;
    const logic [31:0] FLAG_INVALID_MASK   =  32'd16;

    const logic [31:0] OP_ADD   = 32'd1;
    const logic [31:0] OP_SUB   = 32'd2;
    const logic [31:0] OP_MUL   = 32'd3;
    const logic [31:0] OP_DIV   = 32'd4;
    const logic [31:0] OP_FMA   = 32'd5;
    const logic [31:0] OP_SQRT  = 32'd6;
    const logic [31:0] OP_REM   = 32'd7;
    const logic [31:0] OP_CFI   = 32'd8;
    const logic [31:0] OP_CIF   = 32'd9;
    const logic [31:0] OP_QC    = 32'd10;
    const logic [31:0] OP_SC    = 32'd11;
    const logic [31:0] OP_EQ    = 32'd12;
    const logic [31:0] OP_CLASS = 32'd13;
    // const logic [31:0] OP_

    const logic [31:0] ROUND_NEAR_EVEN   = 32'd0;
    const logic [31:0] ROUND_MINMAG      = 32'd1;
    const logic [31:0] ROUND_MIN         = 32'd2;
    const logic [31:0] ROUND_MAX         = 32'd3;
    const logic [31:0] ROUND_NEAR_MAXMAG = 32'd4;
    const logic [31:0] ROUND_ODD         = 32'd6;

    typedef struct {
        logic [15:0] val;
    } float16_t;

    typedef struct {
        logic [31:0] val;
    } float32_t;

    typedef struct {
        logic [63:0] val;
    } float64_t;
    
    typedef struct packed {
        logic [63:0] high;
        logic [63:0] low;
    } float128_t;

    typedef struct packed {
        bit          sign;
        logic [15:0] exp;
        logic [15:0] sig;
    } intermFloat16_t;

    typedef struct packed {
        bit          sign;
        logic [15:0] exp;
        logic [31:0] sig;
    } intermFloat32_t;

    typedef struct packed {
        bit          sign;
        logic [15:0] exp;
        logic [63:0] sig;
    } intermFloat64_t;

    typedef struct packed {
        bit          sign;
        logic [31:0] exp;
        logic [63:0] sig64;
        logic [63:0] sig0;
        logic [63:0] sigExtra;
    } intermFloat128_t;
    
    typedef struct packed {
        // reported by DUT
        logic [31:0]     op, rm;
        logic [31:0]     enableBits, exceptionBits;
        float128_t       a, b, c, result;
        // reported by reference
        float128_t       expectedResult;
        intermFloat128_t intermResult;
    } coverfloat128_t;

    typedef struct packed {
        // reported by DUT
        logic [31:0]    op, rm;
        logic [31:0]    enableBits, exceptionBits;
        float16_t       a, b, c, result;
        // reported by reference
        float16_t       expectedResult;
        intermFloat16_t intermResult;
    } coverfloat16_t;

    typedef struct packed {
        // reported by DUT
        logic [31:0]    op, rm;
        logic [31:0]    enableBits, exceptionBits;
        float32_t       a, b, c, result;
        // reported by reference
        float32_t       expectedResult;
        intermFloat32_t intermResult;
    } coverfloat32_t;

    typedef struct packed {
        // reported by DUT
        logic [31:0]    op, rm;
        logic [31:0]    enableBits, exceptionBits;
        float64_t       a, b, c, result;
        // reported by reference
        float64_t       expectedResult;
        intermFloat64_t intermResult;
    } coverfloat64_t;

    import "DPI-C" function automatic coverfloat16_t  coverfloat16Ref  (uint32_t op, float16_t  a, float16_t  b, float16_t  c, uint32_t rm, uint32_t enableBits); 
    import "DPI-C" function automatic coverfloat32_t  coverfloat32Ref  (uint32_t op, float32_t  a, float32_t  b, float32_t  c, uint32_t rm, uint32_t enableBits);
    import "DPI-C" function automatic coverfloat64_t  coverfloat64Ref  (uint32_t op, float64_t  a, float64_t  b, float64_t  c, uint32_t rm, uint32_t enableBits);
    import "DPI-C" function automatic coverfloat128_t coverfloat128Ref (uint32_t op, float128_t a, float128_t b, float128_t c, uint32_t rm, uint32_t enableBits);

endpackage