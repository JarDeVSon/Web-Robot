*** Settings ***
Library    Screenshot
Library    SeleniumLibrary

*** Keywords ***
Dado ${keyword}
    Run keyword And Continue On Failure  ${keyword}


Quando ${keyword}
    Run Keyword And Continue On Failure  ${keyword}

Então ${keyword}
    Run Keyword And Continue On Failure  ${keyword}

E ${keyword}
    Run keyword And Continue On Failure  ${keyword}