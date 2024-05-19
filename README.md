# MATLAB-Script-TSP-Data-Analysis

## Overview
This MATLAB script, `tspAnalyze`, loads and analyzes data related to the Traveling Salesman Problem (TSP). It provides functionalities to print the database, limit the dimensions, and plot specific tours. The script operates through a menu-driven interface allowing users to interact with the data and perform various operations.

## Functions

### `tspAnalyze`
- **Description**: Main function that orchestrates the execution of the script. It loads data, displays a menu, and processes user choices.
- **Side Effects**: Loads data from `tspData.mat`, displays text from `tspAbout.txt`, prints menu, and handles user inputs.

### `tspMenu`
- **Description**: Displays a menu and returns the user's choice.
- **Side Effects**: Prints menu options on the command window.
- **Input Arguments**: None.
- **Output Arguments**: `choice` - User's menu selection.

### `tspPrint`
- **Description**: Prints the number, filename, data type, dimension, and comment for all entries in the structure.
- **Side Effects**: Prints data on the command window.
- **Input Arguments**: `tsp` - Structure containing TSP data.
- **Output Arguments**: None.

### `tspPlot`
- **Description**: Prompts the user to enter a number and plots the tour if the `edge_weight_type` is `EUC_2D`.
- **Side Effects**: Prompts user input and prints messages on the command window.
- **Input Arguments**: `tsp` - Structure containing TSP data.
- **Output Arguments**: None.

### `tspPlotEUC2D`
- **Description**: Plots the TSP tour as an image file.
- **Side Effects**: Prints plot to `tspPlot.tif`.
- **Input Arguments**: `tsp1` - Specific TSP entry to plot.
- **Output Arguments**: None.

### `tspLimit`
- **Description**: Limits the TSP entries based on user-defined dimension criteria.
- **Side Effects**: Prompts user input and prints messages on the command window.
- **Input Arguments**: `tsp` - Structure containing TSP data.
- **Output Arguments**: `tsp_new` - New structure with limited entries.

### `errorchecking`
- **Description**: Checks if a number is within a specified range and meets various conditions.
- **Side Effects**: None.
- **Input Arguments**: `number` - Number to check, `min` - Minimum valid value, `max` - Maximum valid value.
- **Output Arguments**: `condition` - Boolean indicating if the number meets the conditions.

## Usage
1. **Run the Script**: Execute `tspAnalyze` in MATLAB.
2. **View Menu**: The menu will display options to print the database, limit dimensions, plot a tour, or exit.
3. **Select Option**: Enter a choice (0-3) to perform the corresponding action.
4. **Follow Prompts**: Depending on the choice, follow the prompts to input required data or view results.
