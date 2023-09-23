#  Web Automation Robot Framework

Sample project to demonstrate Web Automation tests written with [Robot Framework](https://robotframework.org/#resources) with [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary/) running on GitHub Actions.

## Pre-requirements

To clone and run this project, you will need:

- [Git](https://git-scm.com/downloads)(I've used version `2.34.1` while writing this doc)
- [Python](https://www.python.org/)(I've used version `3.11.5` while writing this doc)
- [Visual Studio Code](https://code.visualstudio.com/)(I've used version `Stable Build` while writing this doc)
- [Robot Framework Language Server Extension](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)(Install the official extension in the Visual Studio Code)

## Installation

Install the Following Libraries using the command Line:

- `python -m pip install robotframework`
- `python -m pip install robotframework-seleniumlibrary`


## Running the tests

In this project, you can run tests via CLI in both environments with the flag `-v` generate the reports with the flag `-d` and pass the path to suite tests `Tests/01__TestCaseBDD.robot`:

- to run DEV `python -m robot -d reports -v ENVIRONMENT:dev Tests/01__TestCaseBDD.robot`
- to run HOM `python -m robot -d reports -v ENVIRONMENT:hom Tests/01__TestCaseBDD.robot`
___

Made with ❤️ by [Jardeson Santos ](https://github.com/JarDeVSon).
