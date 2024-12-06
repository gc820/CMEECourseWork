# Stats in R: Week 5

## Description
This repository contains a collection of R scripts, from the practical work done Week 5. These files demonstrate basic data wrangling, statistical tests/models, plotting graphs and other data handling in R. 

## Languages
- **R**: (version 4.3.3)

## Dependencies

### R
The R scripts in this repository require the following packages:
- **dplyr**: Data manipulation and transformation.
- **ggplot2**: Visualizations.
- **stats**: Built-in statistical functions.
- **readr**: Reading and writing data files.
- **tidyr**: For tidying and reshaping data.

Install required R packages by running:
```r
install.packages(c("dplyr", "ggplot2", "readr", "tidyr"))
```
## Code Descriptions
Each script is self-contained - run scripts by using `source("<filename>.R")`.

- **Sws.ho1.R**: Hand out 1 R script for stats week. Contains basic functions in R for testing out built-in R funtions and importing data.
  - **Input**: `SparrowSize.txt` data file.
  - **Output**: Prints values to terminal.
  - **Usage**: `source("Sws.ho1.R")`
  - **Dependencies**: `lme4`
 
 - **Sws.ho2.R**: Hand out 2 R script for stats week. Contains data wrangling and calculations, including plotting in R.
  - **Input**: `SparrowSize.txt` data file.
  - **Output**: Calculates values, printing to the terminal and produces plots/graphs.
  - **Usage**: `source("Sws.ho2.R")`
  - **Dependencies**: None 
  
 - **Sws.ho3.R**: Hand out 3 R script for stats week. Contains functions in R, plotting histograms to visualise data. 
  - **Input**: `SparrowSize.txt` data file
  - **Output**: Prints graphs to the terminal.
  - **Usage**: `source("Sws.ho3.R")`
  - **Dependencies**: None 
  
 - **Sws.ho4.R**: Hand out 4 R script for stats week. Contains basic functions in R to calculate different values from the wrangled dataset, then performing statistical tests. 
  - **Input**: `SparrowSize.txt` data file.
  - **Output**: Prints values and statistical test outputs to the terminal.
  - **Usage**: `source("Sws.ho4.R")`
  - **Dependencies**: `plotrix`
 
  - **Sws.ho5.R**: Hand out 5 R script for stats week. Contains statistical tests, on imported dataset, including data wrangling and plotting.
  - **Input**: `SparrowSize.txt` data file.
  - **Output**: Prints statistical test outputs and plots to the terminal.
  - **Usage**: `source("Sws.ho5.R")`
  - **Dependencies**: None 
 
 - **Sws.ho6.R**: Hand out 6 R script for stats week. Contains random sampling of numbers, plotting and statistical power analyses. 
  - **Input**: None (all self contained within the script).
  - **Output**: Prints the results of statistical tests to the terminal.
  - **Usage**: `source("Sws.ho6.R")`
  - **Dependencies**: `WebPower`
  
 - **Sws.ho7&8.R**: Hand out 5 R script for stats week. Contains statistical models, indexing/accessing certain elements and plotting in R. 
  - **Input**: None (all self contained within the script).
  - **Output**: Prints the results of statistical tests to the terminal.
  - **Usage**: `source("Sws.ho7&8.R")`
  - **Dependencies**: None 
 
 - **Sws.ho9.R**: Hand out 5 R script for stats week. Contains calculations from the data, plotting and linear model summaries.
  - **Input**: `SparrowSize.txt` data file
  - **Output**: Prints the results to the terminal. 
  - **Usage**: `source("Sws.ho9.R")`
  - **Dependencies**: None 
  
 - **Sws.ho10.R**: Hand out 10 R script for stats week. Contains lots of plots from random normalled disributed sample numbers.
  - **Input**: None 
  - **Output**: Prints the plotting results to the terminal. 
  - **Usage**: `source("Sws.ho10.R")`
  - **Dependencies**: None
 
 - **Sws.ho11.R**:  Hand out 10 R script for stats week. Contains lots of different types of plots with calculated standard error checks.  
  - **Input**: `daphnia.txt` data file
  - **Output**: Prints the plotting results to the terminal.
  - **Usage**: `source("Sws.ho11.R")`
  - **Dependencies**: `dplyr`
  
 - **Sws.ho12.R**: Hand out 12 R script for stats week. Contains anovas, post-hoc tests, statistical modelling and data wrangling. 
  - **Input**: `SparrowSize.txt`, `Aconite.csv` data files
  - **Output**: Prints the plotting and model results to the terminal. 
  - **Usage**: `source("Sws.ho12.R")`
  - **Dependencies**: `dplyr`
 
 - **Sws.ho13.R**: Hand out 13 R script for stats week. Contains statistical tests, modelling, calculation of repeatability.
  - **Input**: `SparrowSize.txt`, `Wylde_single.mounted.txt` data files
  - **Output**: Prints the results to the terminal.
  - **Usage**: `source("Sws.ho13.R")`
  - **Dependencies**: `lme4`

## Data
Datasets available in the `.../data/` folder for running scripts:
- `Aconite.csv`
- `BTLD.txt`
- `daphnia.txt`
- `ipomopsis.txt`
- `OrnamentAge.txt`
- `SparrowSize.txt`
- `timber.txt`
- `Wylde_single.mounted.txt`

## Results
All results from scripts will be saved in the `results` folder.

## Author
Georgina Chow  
Email: [georgina.chow20@imperial.ac.uk](mailto:georgina.chow20@imperial.ac.uk)


