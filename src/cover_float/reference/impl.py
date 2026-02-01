from typing import TextIO
import cover_float._reference

TEST_VECTOR_LENGTH = 212

def run_and_store_test_vector(test_vector: str, test_file: TextIO, cover_file: TextIO) -> None:
    """Run test_vector through coverfloat and store both the test vector and cover vector"""

    cover_vector = cover_float._reference.run_test_vector(test_vector)

    generated_test_vector = cover_vector[:TEST_VECTOR_LENGTH]
    test_file.write(generated_test_vector + "\n")
    cover_file.write(cover_vector + "\n")