// Copyright (C) 2025-26 Harvey Mudd College
//
// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, any work distributed under the
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.

covergroup B25_cg (virtual coverfloat_interface CFI);

    option.per_instance = 0;

    CIF_op: coverpoint CFI.op {
        type_option.weight = 0;
        bins op_cif = {OP_CIF};
    }

    INT32_operand_fmt: coverpoint (CFI.operandFmt == FMT_INT) {
        type_option.weight = 0;
        bins int32 = {1};
    }

    UINT32_operand_fmt: coverpoint (CFI.operandFmt == FMT_UINT) {
        type_option.weight = 0;
        bins uint32 = {1};
    }

    `ifdef COVER_LONG
        INT64_operand_fmt: coverpoint (CFI.operandFmt == FMT_LONG) {
            type_option.weight = 0;
            bins int64 = {1};
        }

        UINT64_operand_fmt: coverpoint (CFI.operandFmt == FMT_ULONG) {
            type_option.weight = 0;
            bins uint64 = {1};
        }
    `endif // COVER_LONG

    F16_result_fmt: coverpoint (CFI.resultFmt == FMT_HALF) {
        type_option.weight = 0;
        bins f16 = {1};
    }

    BF16_result_fmt: coverpoint (CFI.resultFmt == FMT_BF16) {
        type_option.weight = 0;
        bins bf16 = {1};
    }

    F32_result_fmt: coverpoint (CFI.resultFmt == FMT_SINGLE) {
        type_option.weight = 0;
        bins f32 = {1};
    }

    F64_result_fmt: coverpoint (CFI.resultFmt == FMT_DOUBLE) {
        type_option.weight = 0;
        bins f64 = {1};
    }

    F128_result_fmt: coverpoint (CFI.resultFmt == FMT_QUAD) {
        type_option.weight = 0;
        bins f128 = {1};
    }

    INT32_special_values: coverpoint CFI.a[31:0] {
        type_option.weight = 0;
        bins zero         = {32'h00000000};           // 0
        bins pos_one      = {32'h00000001};           // +1
        bins neg_one      = {32'hFFFFFFFF};           // -1 (two's complement)
        bins pos_maxint   = {32'h7FFFFFFF};           // +MaxInt (2^31 - 1)
        bins neg_maxint   = {32'h80000000};           // -MaxInt (most negative: -2^31)
        bins other_values = {[32'h00000002 : 32'h7FFFFFFE],  // Positive values between +1 and +MaxInt
                             [32'h80000001 : 32'hFFFFFFFE]}; // Negative values between -MaxInt and -1
    }

    UINT32_special_values: coverpoint CFI.a[31:0] {
        type_option.weight = 0;
        bins zero         = {32'h00000000};           // 0
        bins pos_one      = {32'h00000001};           // +1
        bins pos_maxint   = {32'hFFFFFFFF};           // +MaxInt (2^32 - 1)
        bins other_values = {[32'h00000002 : 32'hFFFFFFFE]}; // Values between +1 and +MaxInt
    }

    `ifdef COVER_LONG
        INT64_special_values: coverpoint CFI.a[63:0] {
            type_option.weight = 0;
            bins zero         = {64'h0000000000000000};           // 0
            bins pos_one      = {64'h0000000000000001};           // +1
            bins neg_one      = {64'hFFFFFFFFFFFFFFFF};           // -1 (two's complement)
            bins pos_maxint   = {64'h7FFFFFFFFFFFFFFF};           // +MaxInt (2^63 - 1)
            bins neg_maxint   = {64'h8000000000000000};           // -MaxInt (most negative: -2^63)
            bins other_values = {[64'h0000000000000002 : 64'h7FFFFFFFFFFFFFFE],  // Positive values
                                 [64'h8000000000000001 : 64'hFFFFFFFFFFFFFFFE]}; // Negative values
        }

        UINT64_special_values: coverpoint CFI.a[63:0] {
            type_option.weight = 0;
            bins zero         = {64'h0000000000000000};           // 0
            bins pos_one      = {64'h0000000000000001};           // +1
            bins pos_maxint   = {64'hFFFFFFFFFFFFFFFF};           // +MaxInt (2^64 - 1)
            bins other_values = {[64'h0000000000000002 : 64'hFFFFFFFFFFFFFFFE]}; // Values between +1 and +MaxInt
        }
    `endif // COVER_LONG


    `ifdef COVER_F16
        B25_INT32_F16: cross CIF_op, INT32_special_values, INT32_operand_fmt, F16_result_fmt;
    `endif

    `ifdef COVER_BF16
        B25_INT32_BF16: cross CIF_op, INT32_special_values, INT32_operand_fmt, BF16_result_fmt;
    `endif

    `ifdef COVER_F32
        B25_INT32_F32: cross CIF_op, INT32_special_values, INT32_operand_fmt, F32_result_fmt;
    `endif

    `ifdef COVER_F64
        B25_INT32_F64: cross CIF_op, INT32_special_values, INT32_operand_fmt, F64_result_fmt;
    `endif

    `ifdef COVER_F128
        B25_INT32_F128: cross CIF_op, INT32_special_values, INT32_operand_fmt, F128_result_fmt;
    `endif

    `ifdef COVER_F16
        B25_UINT32_F16: cross CIF_op, UINT32_special_values, UINT32_operand_fmt, F16_result_fmt;
    `endif

    `ifdef COVER_BF16
        B25_UINT32_BF16: cross CIF_op, UINT32_special_values, UINT32_operand_fmt, BF16_result_fmt;
    `endif

    `ifdef COVER_F32
        B25_UINT32_F32: cross CIF_op, UINT32_special_values, UINT32_operand_fmt, F32_result_fmt;
    `endif

    `ifdef COVER_F64
        B25_UINT32_F64: cross CIF_op, UINT32_special_values, UINT32_operand_fmt, F64_result_fmt;
    `endif

    `ifdef COVER_F128
        B25_UINT32_F128: cross CIF_op, UINT32_special_values, UINT32_operand_fmt, F128_result_fmt;
    `endif

    `ifdef COVER_LONG
        `ifdef COVER_F16
            B25_INT64_F16: cross CIF_op, INT64_special_values, INT64_operand_fmt, F16_result_fmt;
        `endif

        `ifdef COVER_BF16
            B25_INT64_BF16: cross CIF_op, INT64_special_values, INT64_operand_fmt, BF16_result_fmt;
        `endif

        `ifdef COVER_F32
            B25_INT64_F32: cross CIF_op, INT64_special_values, INT64_operand_fmt, F32_result_fmt;
        `endif

        `ifdef COVER_F64
            B25_INT64_F64: cross CIF_op, INT64_special_values, INT64_operand_fmt, F64_result_fmt;
        `endif

        `ifdef COVER_F128
            B25_INT64_F128: cross CIF_op, INT64_special_values, INT64_operand_fmt, F128_result_fmt;
        `endif
    `endif // COVER_LONG

    `ifdef COVER_LONG
        `ifdef COVER_F16
            B25_UINT64_F16: cross CIF_op, UINT64_special_values, UINT64_operand_fmt, F16_result_fmt;
        `endif

        `ifdef COVER_BF16
            B25_UINT64_BF16: cross CIF_op, UINT64_special_values, UINT64_operand_fmt, BF16_result_fmt;
        `endif

        `ifdef COVER_F32
            B25_UINT64_F32: cross CIF_op, UINT64_special_values, UINT64_operand_fmt, F32_result_fmt;
        `endif

        `ifdef COVER_F64
            B25_UINT64_F64: cross CIF_op, UINT64_special_values, UINT64_operand_fmt, F64_result_fmt;
        `endif

        `ifdef COVER_F128
            B25_UINT64_F128: cross CIF_op, UINT64_special_values, UINT64_operand_fmt, F128_result_fmt;
        `endif
    `endif // COVER_LONG

endgroup
