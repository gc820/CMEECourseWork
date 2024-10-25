# CMEE Coursework Repository

## Description
This repository hosts the CMEE bootcamp coursework and class files. It includes organized scripts, data, and documentation to support learning in areas such as shell scripting, Python programming, LaTeX, and R.

## Languages
- **Bash**: (version 5.2.21(1))
- **Python**: (version 3.12.3)
- **LaTeX**
- **R**: (version 4.3.3)

## Dependencies
- **Python**: Requires Python 3.12.3. Standard library modules used:
  - `csv`: For CSV file operations.
  - `sys`: For command-line interactions.
  - `doctest`: For embedded code testing.

These modules are part of Python’s standard library, so no additional installations are required. R scripts also use only the standard library.

## Installation
No installation is needed. All code can be executed directly in a terminal or compatible code editor.

## Project Structure and Usage
The project is organized to reflect the structure of the CMEE bootcamp, with coursework separated by weeks. Each weekly folder includes the following subdirectories:

- **code**: Contains runnable scripts for coursework tasks.
- **data**: Holds input data files required by the scripts.
- **results**: Stores output files generated by scripts, though this folder may be initially empty as output files are typically generated on demand.


### Usage Instructions
1. **Prepare the Environment**:
   - Ensure all required input files are placed in the `data` folder.
   - Open a terminal or code editor with terminal access.

2. **Run Scripts**:
   - Navigate to the folder containing the script you wish to run (usually found in `code`).
   - Execute Bash scripts by entering `bash <filename>.sh` in the terminal.
   - Run Python scripts with `python3 <filename>.py`.
   - Execute R scripts using `Rscript <filename>.R`.

3. **Example Command Execution**:
   - For Bash: `bash CompileLaTeX.sh`
   - For Python: `python3 align_seqs.py`
   - For R: `Rscript DataWrang.R`

4. **Output Files**:
   - Generated output files will automatically be saved in the `results` folder for easy tracking and organization.

5. **File Management**:
   - Avoid committing files in the `results` folder to version control unless necessary, as they are typically generated outputs.


## Author
Georgina Chow  
Email: [georgina.chow20@imperial.ac.uk](mailto:georgina.chow20@imperial.ac.uk)

