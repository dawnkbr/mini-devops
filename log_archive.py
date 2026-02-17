import tarfile
import os
import sys
from datetime import datetime

def compress_directory(source_dir, output_dir="."):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    dir_name = os.path.basename(os.path.normpath(source_dir))
    output_filename = f"{dir_name}_{timestamp}.tar.gz"
    output_path = os.path.join(output_dir, output_filename)

    print(f"Compressing '{source_dir}' to '{output_path}'...")

    with tarfile.open(output_path, "w:gz") as tar:
        tar.add(source_dir, arcname=dir_name)

    print("Done!")
    return output_path

# --- Usage ---
# Replace 'data' with the folder you want to compress
if len(sys.argv) > 1:
    compress_directory(sys.argv[1])

