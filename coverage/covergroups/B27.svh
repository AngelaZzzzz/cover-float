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
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.

covergroup B27_cg (virtual coverfloat_interface CFI);

    option.per_instance = 0;

    // CFF Operation Helper Coverpoint
    CFF_op: coverpoint CFI.op {
        type_option.weight = 0;
        bins cff = {OP_CFF};
    }

    // F32 NaN Class Coverpoints
    F32_nan_class: coverpoint CFI.a[F32_M_UPPER]
        iff (CFI.operandFmt == FMT_SINGLE
             && CFI.a[F32_E_UPPER:F32_E_LOWER] == '1     // exp all ones
             && CFI.a[F32_M_UPPER:0] != 0) {             // fraction nonzero  => NaN
            type_option.weight = 0;
            bins qnan = {1};
            bins snan = {0};
        }

    // F32 to F16 Surviving Coverpoints
    F32_to_F16_surviving: coverpoint (CFI.a[F32_M_UPPER-1 -: (F16_M_BITS-1)] == '0)
        iff (CFI.operandFmt == FMT_SINGLE && CFI.resultFmt == FMT_HALF
             && CFI.a[F32_E_UPPER:F32_E_LOWER] == '1 && CFI.a[F32_M_UPPER:0] != 0) {
            type_option.weight = 0;
            bins all_zero = {1};
            bins not_zero = {0};
        }
    F32_to_F16_truncated: coverpoint (CFI.a[F32_M_UPPER-F16_M_BITS : 0] == '0)
        iff (CFI.operandFmt == FMT_SINGLE && CFI.resultFmt == FMT_HALF
             && CFI.a[F32_E_UPPER:F32_E_LOWER] == '1 && CFI.a[F32_M_UPPER:0] != 0) {
            type_option.weight = 0;
            bins all_zero = {1};
            bins not_zero = {0};
        }

    // F32 to BF16 Surviving Coverpoints
    F32_to_BF16_surviving: coverpoint (CFI.a[F32_M_UPPER-1 -: (BF16_M_BITS-1)] == '0)
        iff (CFI.operandFmt == FMT_SINGLE && CFI.resultFmt == FMT_BF16
             && CFI.a[F32_E_UPPER:F32_E_LOWER] == '1 && CFI.a[F32_M_UPPER:0] != 0) {
            type_option.weight = 0;
            bins all_zero = {1};
            bins not_zero = {0};
        }
    F32_to_BF16_truncated: coverpoint (CFI.a[F32_M_UPPER-BF16_M_BITS : 0] == '0)
        iff (CFI.operandFmt == FMT_SINGLE && CFI.resultFmt == FMT_BF16
             && CFI.a[F32_E_UPPER:F32_E_LOWER] == '1 && CFI.a[F32_M_UPPER:0] != 0) {
            type_option.weight = 0;
            bins all_zero = {1};
            bins not_zero = {0};
        }

    // Crosses
    // sNaN with an all-zero fraction (surviving + truncated both zero) is ±Inf, not a NaN,
    // so that combination is structurally unreachable and is ignored.
    `ifdef COVER_F32
        `ifdef COVER_F16
            B27_F32_to_F16:  cross CFF_op, F32_nan_class, F32_to_F16_surviving,  F32_to_F16_truncated {
                ignore_bins inf = binsof(F32_nan_class.snan)
                                  && binsof(F32_to_F16_surviving.all_zero)
                                  && binsof(F32_to_F16_truncated.all_zero);
            }
        `endif
        `ifdef COVER_BF16
            B27_F32_to_BF16: cross CFF_op, F32_nan_class, F32_to_BF16_surviving, F32_to_BF16_truncated {
                ignore_bins inf = binsof(F32_nan_class.snan)
                                  && binsof(F32_to_BF16_surviving.all_zero)
                                  && binsof(F32_to_BF16_truncated.all_zero);
            }
        `endif
    `endif

endgroup
