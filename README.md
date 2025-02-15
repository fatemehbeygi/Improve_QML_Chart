# ImproveQMLChart

This project is a Qt application that demonstrates how to create and manipulate a dynamic chart using QML and C++.

## Features

- Dynamic chart generation with random data points
- Interactive controls to zoom in/out and reset the chart
- Integration of QML and C++ for efficient data handling

## Project Structure

- `databuilder.cpp` and `databuilder.h`: Contains the `DataBuilder` class which generates random data points and updates the chart.
- `main.cpp`: Sets up the Qt application and exposes the `DataBuilder` instance to QML.
- `main.qml`: Defines the user interface, including the chart and interactive controls.
- `qml.qrc`: Resource file that includes QML files.
- `ImproveQMLChart.pro`: Qt project file that defines the build configuration.

## Getting Started

### Prerequisites

- Qt 5.12 or later
- C++ compiler

### Building the Project

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd ImproveQMLChart
    ```

2. Open the project in Qt Creator or build from the command line:
    ```sh
    qmake ImproveQMLChart.pro
    make
    ```

### Running the Application

After building the project, run the executable:
```sh
./qmlchart
```

## Usage

 - Click the "Generate" button to populate the chart with random data points.
 -Use the "+" and "-" buttons to zoom in and out on the X and Y axes.
 -Click the "⟳" button to reset the axes to their default ranges.
