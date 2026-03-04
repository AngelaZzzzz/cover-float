"""
Angela Zheng

March 3, 2026

SUMMARY
This script generates test vectors for the B2 model: Near FP Base Values - Hamming Distance.
It takes specific boundary values (Zero, One, MinSubNorm, etc.) and enumerates over
small deviations by flipping one bit of the significand at a time.

DEFINITION
Base Values: Zero, One, MinSubNorm, MaxSubNorm, MinNorm, MaxNorm
Operations: add, sub, multiply, fmadd, fmsub, fnmadd, fnmsub, sqrt
Total test vectors generated: TBD
"""

import random
from pathlib import Path
from typing import TextIO

from cover_float.common.constants import (
    EXPONENT_BITS,
    FLOAT_FMTS,
    MANTISSA_BITS,
    OP_ADD,
    OP_DIV,
    OP_FMADD,
    OP_FMSUB,
    OP_FNMADD,
    OP_FNMSUB,
    OP_MUL,
    OP_SQRT,
    OP_SUB,
    ROUND_NEAR_EVEN,
)
from cover_float.reference import run_and_store_test_vector

THREE_OP_OPS = [
    OP_FMADD,
    OP_FMSUB,
    OP_FNMADD,
    OP_FNMSUB,
]

ALL_OPS = [
    OP_ADD,
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_SQRT,
    OP_FMADD,
    OP_FMSUB,
    OP_FNMADD,
    OP_FNMSUB,
]


def getBaseValues(fmt: str) -> dict[str, int]:
    """
    exponent bits + mantissa
    """
    m = MANTISSA_BITS[fmt]
    e = EXPONENT_BITS[fmt]
    bias = (2 ** (e - 1)) - 1

    bases = {
        "Zero": 0,
        "One": bias << m,
        "MinSubNorm": 1,
        "MaxSubNorm": (1 << m) - 1,
        "MinNorm": 1 << m,
        "MaxNorm": (((1 << e) - 2) << m) | ((1 << m) - 1),
    }
    return bases


def generateOperands(
    op: str, fmt: str, a_hex: str, sign: int, total_bits: int, test_f: TextIO, cover_f: TextIO
) -> None:
    """Handles logic for B and C operands and writes the final vector."""
    # Skip sqrt for negative values
    if op == OP_SQRT and sign == 1:
        return

    b_hex = f"{random.getrandbits(total_bits):032X}"
    c_hex = f"{random.getrandbits(total_bits):032X}" if op in THREE_OP_OPS else f"{0:032X}"

    run_and_store_test_vector(
        f"{op}_{ROUND_NEAR_EVEN}_{a_hex}_{b_hex}_{c_hex}_{fmt}_{fmt}_{fmt}_00",
        test_f,
        cover_f,
    )


def hammingProcessor(base_val: int, fmt: str, total_bits: int, test_f: TextIO, cover_f: TextIO) -> None:
    """Flips significand bits and iterates through all operations."""
    m_width = MANTISSA_BITS[fmt]

    for sign in [0, 1]:
        signed_base = base_val | (sign << (total_bits - 1))

        for bit_pos in range(m_width):
            test_val = signed_base ^ (1 << bit_pos)
            a_hex = f"{test_val:032X}"

            for op in ALL_OPS:
                generateOperands(op, fmt, a_hex, sign, total_bits, test_f, cover_f)


def main() -> None:
    with (
        Path("./tests/testvectors/B2_tv.txt").open("w") as test_f,
        Path("./tests/covervectors/B2_cv.txt").open("w") as cover_f,
    ):
        for fmt in FLOAT_FMTS:
            total_bits = 1 + EXPONENT_BITS[fmt] + MANTISSA_BITS[fmt]
            bases = getBaseValues(fmt)

            for base_val in bases.values():
                hammingProcessor(base_val, fmt, total_bits, test_f, cover_f)


if __name__ == "__main__":
    main()
