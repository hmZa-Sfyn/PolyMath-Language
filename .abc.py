import os

def change_extensions(root_dir, new_ext=".pms"):
    # Walk through all directories and files
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            file_path = os.path.join(dirpath, filename)
            
            # Get file name without extension
            base, _ = os.path.splitext(file_path)
            
            # New file path with new extension
            new_file_path = base + new_ext
            
            # Rename the file
            os.rename(file_path, new_file_path)
            print(f"Renamed: {file_path} -> {new_file_path}")

if __name__ == "__main__":
    # Change this path to your exampels directory
    root_directory = "./examples"
    change_extensions(root_directory)
