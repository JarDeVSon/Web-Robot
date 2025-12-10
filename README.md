#  Web Automation Robot Framework

Sample project to demonstrate Web e API Automation tests written with [Robot Framework](https://robotframework.org/#resources) with Selenium Library e Requests Library running on GitHub Actions.

## Pre-requirements

To clone and run this project, you will need:

- [Git](https://git-scm.com/downloads)(I've used version `2.34.1` while writing this doc)
- [Python](https://www.python.org/)(I've used version `3.11.5` while writing this doc)
- [Visual Studio Code](https://code.visualstudio.com/)(I've used version `Stable Build` while writing this doc)
- [Robot Framework Language Server Extension](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)(Install the official extension in the Visual Studio Code)

## Installation

Install the Following Libraries using the command Line:

- `python -m pip install -r requirements.txt`

## Project Structure - Using Page Objects Pattern

tests/
├── resources/
│   ├── loginBack.resource        # Keywords for backend tests (login)
│   └── loginPage.resource        # Keywords for frontend tests (login)
├── tests/
│   ├── login_back.robot          # Test cases for backend (login)
│   └── login_front.robot         # Test cases for frontend (login)
│   └── __init__.robot            # Test Hooks Configurations 
├── .gitignore                    # File to ignore files in Git
├── base.resource                 # base global variables and configurations
├── README.md                     # This file
└── requirements.txt              # List of project dependencies

## Running the tests

In this project, you can run tests via CLI and generate the reports with the flag `-d` and pass the path to suite tests `tests/`:

To run Frontend tests:

- `python -m robot -d reports tests/front/login_front.robot`

To run Backend tests:

- `python -m robot -d reports tests/back/login_back.robot`

To run using Test Tags between back and front: (front,back)

- `python -m robot -d reports -i front tests/`
- `python -m robot -d reports -i back tests/`


To run All the tests:

- `python -m robot -d reports tests/`
___