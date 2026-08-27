#!/usr/bin/env python3
"""
For each of the images in a directory, detect the image type and rename the file suffix
if necessary.
This is useful for images that have been renamed with the wrong suffix, or have no suffix at all.
"""

import argparse
from pathlib import Path
import logging


def detect_image_type(p: Path) -> str | None:
    """
    Detect the image type based on the file signature (magic number).
    Returns the appropriate file extension (e.g., '.jpg', '.png', etc.) or None if unknown.
    """
    with p.open("rb") as f:
        header = f.read(8)  # Read the first 8 bytes for detection

    if header.startswith(b"\xff\xd8\xff"):
        return ".jpg"
    elif header.startswith(b"\x89PNG\r\n\x1a\n"):
        return ".png"
    elif header.startswith(b"GIF87a") or header.startswith(b"GIF89a"):
        return ".gif"
    elif header.startswith(b"BM"):
        return ".bmp"
    elif header.startswith(b"II*\x00") or header.startswith(b"MM\x00*"):
        return ".tiff"
    else:
        return None


def rename_file(p: Path, new_suffix: str) -> None:
    """
    Rename the file to have the new suffix.
    """
    new_name = p.with_suffix(new_suffix)
    p.rename(new_name)
    print(f"Renamed '{p}' to '{new_name}'")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Detect image type and rename files accordingly."
    )
    parser.add_argument(
        "directory", type=str, help="Directory containing images to process."
    )
    args = parser.parse_args()

    directory = Path(args.directory).expanduser().resolve(strict=True)
    if not directory.is_dir():
        raise NotADirectoryError(directory)

    for file_path in directory.iterdir():
        if file_path.is_file():
            if detected_suffix := detect_image_type(file_path):
                current_suffix = file_path.suffix
                if current_suffix != detected_suffix:
                    rename_file(file_path, detected_suffix)
            else:
                logging.error(f"Could not detect image type for '{file_path}'")
