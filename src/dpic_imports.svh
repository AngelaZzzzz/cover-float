
/*============================================================================

This C header file is part of the SoftFloat IEEE Floating-Point Arithmetic
Package, Release 3d, by John R. Hauser.

Copyright 2011, 2012, 2013, 2014, 2015, 2016, 2017 The Regents of the
University of California.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice,
    this list of conditions, and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions, and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 3. Neither the name of the University nor the names of its contributors may
    be used to endorse or promote products derived from this software without
    specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=============================================================================*/


/*============================================================================
| Note:  If SoftFloat is made available as a general library for programs to
| use, it is strongly recommended that a platform-specific version of this
| header, "softfloat.h", be created that folds in "softfloat_types.h" and that
| eliminates all dependencies on compile-time macros.
*============================================================================*/

/*----------------------------------------------------------------------------
| Routine to raise any or all of the software floating-point exception flags.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic void softfloat_raiseFlags( unsigned byte );

/*----------------------------------------------------------------------------
| Integer-to-floating-point conversion routines.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic bfloat16_t ui32_to_bf16( uint32_t );
import "DPI-C" function automatic float16_t ui32_to_f16( uint32_t );
import "DPI-C" function automatic float32_t ui32_to_f32( uint32_t );
import "DPI-C" function automatic float64_t ui32_to_f64( uint32_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t ui32_to_extF80( uint32_t );
    import "DPI-C" function automatic float128_t ui32_to_f128( uint32_t );
`endif
import "DPI-C" function automatic void ui32_to_extF80M( uint32_t, output extFloat80_t );
import "DPI-C" function automatic void ui32_to_f128M( uint32_t, output float128_t );
import "DPI-C" function automatic float16_t ui64_to_f16( uint64_t );
import "DPI-C" function automatic float32_t ui64_to_f32( uint64_t );
import "DPI-C" function automatic float64_t ui64_to_f64( uint64_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t ui64_to_extF80( uint64_t );
    import "DPI-C" function automatic float128_t ui64_to_f128( uint64_t );
`endif
import "DPI-C" function automatic void ui64_to_extF80M( uint64_t, output extFloat80_t );
import "DPI-C" function automatic void ui64_to_f128M( uint64_t, output float128_t );
import "DPI-C" function automatic bfloat16_t i32_to_bf16( int32_t );
import "DPI-C" function automatic float16_t i32_to_f16( int32_t );
import "DPI-C" function automatic float32_t i32_to_f32( int32_t );
import "DPI-C" function automatic float64_t i32_to_f64( int32_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t i32_to_extF80( int32_t );
    import "DPI-C" function automatic float128_t i32_to_f128( int32_t );
`endif
import "DPI-C" function automatic void i32_to_extF80M( int32_t, output extFloat80_t );
import "DPI-C" function automatic void i32_to_f128M( int32_t, output float128_t );
import "DPI-C" function automatic float16_t i64_to_f16( int64_t );
import "DPI-C" function automatic float32_t i64_to_f32( int64_t );
import "DPI-C" function automatic float64_t i64_to_f64( int64_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t i64_to_extF80( int64_t );
    import "DPI-C" function automatic float128_t i64_to_f128( int64_t );
`endif
import "DPI-C" function automatic void i64_to_extF80M( int64_t, output extFloat80_t );
import "DPI-C" function automatic void i64_to_f128M( int64_t, output float128_t );

/*----------------------------------------------------------------------------
| 16-bit (half-precision) floating-point operations.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic unsigned byte f16_to_ui8( float16_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned shortint f16_to_ui16( float16_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f16_to_ui32( float16_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned longint f16_to_ui64( float16_t, unsigned byte, bit );
import "DPI-C" function automatic signed byte f16_to_i8( float16_t, unsigned byte, bit );
import "DPI-C" function automatic signed shortint f16_to_i16( float16_t, unsigned byte, bit );
import "DPI-C" function automatic signed int f16_to_i32( float16_t, unsigned byte, bit );
import "DPI-C" function automatic signed longint f16_to_i64( float16_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f16_to_ui32_r_minMag( float16_t, bit );
import "DPI-C" function automatic unsigned longint f16_to_ui64_r_minMag( float16_t, bit );
import "DPI-C" function automatic signed int f16_to_i32_r_minMag( float16_t, bit );
import "DPI-C" function automatic signed longint f16_to_i64_r_minMag( float16_t, bit );
import "DPI-C" function automatic float32_t f16_to_f32( float16_t );
import "DPI-C" function automatic float64_t f16_to_f64( float16_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t f16_to_extF80( float16_t );
    import "DPI-C" function automatic float128_t f16_to_f128( float16_t );
`endif
import "DPI-C" function automatic void f16_to_extF80M( float16_t, output extFloat80_t );
import "DPI-C" function automatic void f16_to_f128M( float16_t, output float128_t );
import "DPI-C" function automatic float16_t f16_roundToInt( float16_t, unsigned byte, bit );
import "DPI-C" function automatic float16_t f16_add( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_sub( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_max( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_min( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_mul( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_mulAdd( float16_t, float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_div( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_rem( float16_t, float16_t );
import "DPI-C" function automatic float16_t f16_sqrt( float16_t );
import "DPI-C" function automatic bit f16_eq( float16_t, float16_t );
import "DPI-C" function automatic bit f16_le( float16_t, float16_t );
import "DPI-C" function automatic bit f16_lt( float16_t, float16_t );
import "DPI-C" function automatic bit f16_eq_signaling( float16_t, float16_t );
import "DPI-C" function automatic bit f16_le_quiet( float16_t, float16_t );
import "DPI-C" function automatic bit f16_lt_quiet( float16_t, float16_t );
import "DPI-C" function automatic bit f16_isSignalingNaN( float16_t );
import "DPI-C" function automatic bit f16_sign( float16_t );
import "DPI-C" function automatic unsigned shortint f16_classify( float16_t );
import "DPI-C" function automatic float16_t f16_rsqrte7( float16_t );
import "DPI-C" function automatic float16_t f16_recip7( float16_t );

/*----------------------------------------------------------------------------
| BFloat16 operations.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic unsigned byte bf16_to_ui8( bfloat16_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int bf16_to_ui32( bfloat16_t, unsigned byte, bit );
import "DPI-C" function automatic signed byte bf16_to_i8( bfloat16_t, unsigned byte, bit );
import "DPI-C" function automatic signed int bf16_to_i32( bfloat16_t, unsigned byte, bit );
import "DPI-C" function automatic float32_t bf16_to_f32( bfloat16_t );
import "DPI-C" function automatic float64_t bf16_to_f64( bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_add( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_sub( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_mul( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_mulAdd( bfloat16_t, bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_div( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_sqrt( bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_max( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_min( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bit bf16_eq( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bit bf16_le( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bit bf16_lt( bfloat16_t, bfloat16_t );
import "DPI-C" function automatic bit bf16_sign( bfloat16_t );
import "DPI-C" function automatic unsigned shortint bf16_classify( bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_rsqrte7( bfloat16_t );
import "DPI-C" function automatic bfloat16_t bf16_recip7( bfloat16_t );

/*----------------------------------------------------------------------------
| 32-bit (single-precision) floating-point operations.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic unsigned shortint f32_to_ui16( float32_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f32_to_ui32( float32_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned longint f32_to_ui64( float32_t, unsigned byte, bit );
import "DPI-C" function automatic signed shortint f32_to_i16( float32_t, unsigned byte, bit );
import "DPI-C" function automatic signed int f32_to_i32( float32_t, unsigned byte, bit );
import "DPI-C" function automatic signed longint f32_to_i64( float32_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f32_to_ui32_r_minMag( float32_t, bit );
import "DPI-C" function automatic unsigned longint f32_to_ui64_r_minMag( float32_t, bit );
import "DPI-C" function automatic signed int f32_to_i32_r_minMag( float32_t, bit );
import "DPI-C" function automatic signed longint f32_to_i64_r_minMag( float32_t, bit );
import "DPI-C" function automatic bfloat16_t f32_to_bf16( float32_t );
import "DPI-C" function automatic float16_t f32_to_f16( float32_t );
import "DPI-C" function automatic float64_t f32_to_f64( float32_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t f32_to_extF80( float32_t );
    import "DPI-C" function automatic float128_t f32_to_f128( float32_t );
`endif
import "DPI-C" function automatic void f32_to_extF80M( float32_t, output extFloat80_t );
import "DPI-C" function automatic void f32_to_f128M( float32_t, output float128_t );
import "DPI-C" function automatic float32_t f32_roundToInt( float32_t, unsigned byte, bit );
import "DPI-C" function automatic float32_t f32_add( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_sub( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_max( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_min( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_mul( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_mulAdd( float32_t, float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_div( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_rem( float32_t, float32_t );
import "DPI-C" function automatic float32_t f32_sqrt( float32_t );
import "DPI-C" function automatic bit f32_eq( float32_t, float32_t );
import "DPI-C" function automatic bit f32_le( float32_t, float32_t );
import "DPI-C" function automatic bit f32_lt( float32_t, float32_t );
import "DPI-C" function automatic bit f32_eq_signaling( float32_t, float32_t );
import "DPI-C" function automatic bit f32_le_quiet( float32_t, float32_t );
import "DPI-C" function automatic bit f32_lt_quiet( float32_t, float32_t );
import "DPI-C" function automatic bit f32_isSignalingNaN( float32_t );
import "DPI-C" function automatic bit f32_sign( float32_t );
import "DPI-C" function automatic unsigned shortint f32_classify( float32_t );
import "DPI-C" function automatic float32_t f32_rsqrte7( float32_t );
import "DPI-C" function automatic float32_t f32_recip7( float32_t );

/*----------------------------------------------------------------------------
| 64-bit (double-precision) floating-point operations.
*----------------------------------------------------------------------------*/
import "DPI-C" function automatic unsigned int f64_to_ui32( float64_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned longint f64_to_ui64( float64_t, unsigned byte, bit );
import "DPI-C" function automatic signed int f64_to_i32( float64_t, unsigned byte, bit );
import "DPI-C" function automatic signed longint f64_to_i64( float64_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f64_to_ui32_r_minMag( float64_t, bit );
import "DPI-C" function automatic unsigned longint f64_to_ui64_r_minMag( float64_t, bit );
import "DPI-C" function automatic signed int f64_to_i32_r_minMag( float64_t, bit );
import "DPI-C" function automatic signed longint f64_to_i64_r_minMag( float64_t, bit );
import "DPI-C" function automatic bfloat16_t f64_to_bf16( float64_t );
import "DPI-C" function automatic float16_t f64_to_f16( float64_t );
import "DPI-C" function automatic float32_t f64_to_f32( float64_t );
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic extFloat80_t f64_to_extF80( float64_t );
    import "DPI-C" function automatic float128_t f64_to_f128( float64_t );
`endif
import "DPI-C" function automatic void f64_to_extF80M( float64_t, output extFloat80_t );
import "DPI-C" function automatic void f64_to_f128M( float64_t, output float128_t );
import "DPI-C" function automatic float64_t f64_roundToInt( float64_t, unsigned byte, bit );
import "DPI-C" function automatic float64_t f64_add( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_sub( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_max( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_min( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_mul( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_mulAdd( float64_t, float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_div( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_rem( float64_t, float64_t );
import "DPI-C" function automatic float64_t f64_sqrt( float64_t );
import "DPI-C" function automatic bit f64_eq( float64_t, float64_t );
import "DPI-C" function automatic bit f64_le( float64_t, float64_t );
import "DPI-C" function automatic bit f64_lt( float64_t, float64_t );
import "DPI-C" function automatic bit f64_eq_signaling( float64_t, float64_t );
import "DPI-C" function automatic bit f64_le_quiet( float64_t, float64_t );
import "DPI-C" function automatic bit f64_lt_quiet( float64_t, float64_t );
import "DPI-C" function automatic bit f64_isSignalingNaN( float64_t );
import "DPI-C" function automatic bit f64_sign( float64_t );
import "DPI-C" function automatic unsigned shortint f64_classify( float64_t );
import "DPI-C" function automatic float64_t f64_rsqrte7( float64_t );
import "DPI-C" function automatic float64_t f64_recip7( float64_t );


/*----------------------------------------------------------------------------
| 80-bit extended double-precision floating-point operations.
*----------------------------------------------------------------------------*/

/*
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic unsigned int extF80_to_ui32( extFloat80_t, unsigned byte, bit );
    import "DPI-C" function automatic unsigned longint extF80_to_ui64( extFloat80_t, unsigned byte, bit );
    import "DPI-C" function automatic signed int extF80_to_i32( extFloat80_t, unsigned byte, bit );
    import "DPI-C" function automatic signed longint extF80_to_i64( extFloat80_t, unsigned byte, bit );
    import "DPI-C" function automatic unsigned int extF80_to_ui32_r_minMag( extFloat80_t, bit );
    import "DPI-C" function automatic unsigned longint extF80_to_ui64_r_minMag( extFloat80_t, bit );
    import "DPI-C" function automatic signed int extF80_to_i32_r_minMag( extFloat80_t, bit );
    import "DPI-C" function automatic signed longint extF80_to_i64_r_minMag( extFloat80_t, bit );
    import "DPI-C" function automatic float16_t extF80_to_f16( extFloat80_t );
    import "DPI-C" function automatic float32_t extF80_to_f32( extFloat80_t );
    import "DPI-C" function automatic float64_t extF80_to_f64( extFloat80_t );
    import "DPI-C" function automatic float128_t extF80_to_f128( extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_roundToInt( extFloat80_t, unsigned byte, bit );
    import "DPI-C" function automatic extFloat80_t extF80_add( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_sub( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_mul( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_div( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_rem( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic extFloat80_t extF80_sqrt( extFloat80_t );
    import "DPI-C" function automatic bit extF80_eq( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_le( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_lt( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_eq_signaling( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_le_quiet( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_lt_quiet( extFloat80_t, extFloat80_t );
    import "DPI-C" function automatic bit extF80_isSignalingNaN( extFloat80_t );
`endif
import "DPI-C" function automatic unsigned int extF80M_to_ui32( input extFloat80_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned longint extF80M_to_ui64( input extFloat80_t, unsigned byte, bit );
import "DPI-C" function automatic signed int extF80M_to_i32( input extFloat80_t, unsigned byte, bit );
import "DPI-C" function automatic signed longint extF80M_to_i64( input extFloat80_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int extF80M_to_ui32_r_minMag( input extFloat80_t, bit );
import "DPI-C" function automatic unsigned longint extF80M_to_ui64_r_minMag( input extFloat80_t, bit );
import "DPI-C" function automatic signed int extF80M_to_i32_r_minMag( input extFloat80_t, bit );
import "DPI-C" function automatic signed longint extF80M_to_i64_r_minMag( input extFloat80_t, bit );
import "DPI-C" function automatic float16_t extF80M_to_f16( input extFloat80_t );
import "DPI-C" function automatic float32_t extF80M_to_f32( input extFloat80_t );
import "DPI-C" function automatic float64_t extF80M_to_f64( input extFloat80_t );
import "DPI-C" function automatic void extF80M_to_f128M( input extFloat80_t, output float128_t );
import "DPI-C" function automatic void extF80M_roundToInt(input extFloat80_t, unsigned byte, bit, output extFloat80_t );
import "DPI-C" function automatic void extF80M_add( input extFloat80_t, input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic void extF80M_sub( input extFloat80_t, input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic void extF80M_mul( input extFloat80_t, input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic void extF80M_div( input extFloat80_t, input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic void extF80M_rem( input extFloat80_t, input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic void extF80M_sqrt( input extFloat80_t, output extFloat80_t );
import "DPI-C" function automatic bit extF80M_eq( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_le( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_lt( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_eq_signaling( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_le_quiet( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_lt_quiet( input extFloat80_t, input extFloat80_t );
import "DPI-C" function automatic bit extF80M_isSignalingNaN( input extFloat80_t );
*/

/*----------------------------------------------------------------------------
| 128-bit (quadruple-precision) floating-point operations.
*----------------------------------------------------------------------------*/
`ifdef SOFTFLOAT_FAST_INT64
    import "DPI-C" function automatic unsigned int f128_to_ui32( float128_t, unsigned byte, bit );
    import "DPI-C" function automatic unsigned longint f128_to_ui64( float128_t, unsigned byte, bit );
    import "DPI-C" function automatic signed int f128_to_i32( float128_t, unsigned byte, bit );
    import "DPI-C" function automatic signed longint f128_to_i64( float128_t, unsigned byte, bit );
    import "DPI-C" function automatic unsigned int f128_to_ui32_r_minMag( float128_t, bit );
    import "DPI-C" function automatic unsigned longint f128_to_ui64_r_minMag( float128_t, bit );
    import "DPI-C" function automatic signed int f128_to_i32_r_minMag( float128_t, bit );
    import "DPI-C" function automatic signed longint f128_to_i64_r_minMag( float128_t, bit );
    import "DPI-C" function automatic float16_t f128_to_f16( float128_t );
    import "DPI-C" function automatic float32_t f128_to_f32( float128_t );
    import "DPI-C" function automatic float64_t f128_to_f64( float128_t );
    import "DPI-C" function automatic extFloat80_t f128_to_extF80( float128_t );
    import "DPI-C" function automatic float128_t f128_roundToInt( float128_t, unsigned byte, bit );
    import "DPI-C" function automatic float128_t f128_add( float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_sub( float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_mul( float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_mulAdd( float128_t, float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_div( float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_rem( float128_t, float128_t );
    import "DPI-C" function automatic float128_t f128_sqrt( float128_t );
    import "DPI-C" function automatic bit f128_eq( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_le( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_lt( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_eq_signaling( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_le_quiet( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_lt_quiet( float128_t, float128_t );
    import "DPI-C" function automatic bit f128_isSignalingNaN( float128_t );
    import "DPI-C" function automatic unsigned shortint f128_classify( float128_t );
`endif
import "DPI-C" function automatic unsigned int f128M_to_ui32( input float128_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned longint f128M_to_ui64( input float128_t, unsigned byte, bit );
import "DPI-C" function automatic signed int f128M_to_i32( input float128_t, unsigned byte, bit );
import "DPI-C" function automatic signed longint f128M_to_i64( input float128_t, unsigned byte, bit );
import "DPI-C" function automatic unsigned int f128M_to_ui32_r_minMag( input float128_t, bit );
import "DPI-C" function automatic unsigned longint f128M_to_ui64_r_minMag( input float128_t, bit );
import "DPI-C" function automatic signed int f128M_to_i32_r_minMag( input float128_t, bit );
import "DPI-C" function automatic signed longint f128M_to_i64_r_minMag( input float128_t, bit );
import "DPI-C" function automatic float16_t f128M_to_f16( input float128_t );
import "DPI-C" function automatic float32_t f128M_to_f32( input float128_t );
import "DPI-C" function automatic float64_t f128M_to_f64( input float128_t );
import "DPI-C" function automatic void f128M_to_extF80M( input float128_t, output extFloat80_t );
import "DPI-C" function automatic void f128M_roundToInt( input float128_t, unsigned byte, bit, output float128_t );
import "DPI-C" function automatic void f128M_add( input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_sub( input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_mul( input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_mulAdd( input float128_t, input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_div( input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_rem( input float128_t, input float128_t, output float128_t );
import "DPI-C" function automatic void f128M_sqrt( input float128_t, output float128_t );
import "DPI-C" function automatic bit f128M_eq( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_le( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_lt( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_eq_signaling( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_le_quiet( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_lt_quiet( input float128_t, input float128_t );
import "DPI-C" function automatic bit f128M_isSignalingNaN( input float128_t );


