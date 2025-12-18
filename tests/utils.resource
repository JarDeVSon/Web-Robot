*** Settings ***
Library    SeleniumLibrary  timeout=90    implicit_wait=90    run_on_failure=Capture Page Screenshot
Library    Collections
Library    String
Library    OperatingSystem
Library    DateTime
Library    Process

***Variables***
${BROWSER}    headlesschrome
${ENVIRONMENT_FRONT}  hom
&{URL_LOGIN}    dev=urlDEV  hom=https://front.serverest.dev/login
${USERNAME}    testefront@bol.com 
${PASSWORD}    teste123

*** Keywords ***

Highlight Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].style.outline='3px solid red';
    ...    arguments[0].style.outlineOffset='2px';
    ...    arguments[0].style.boxShadow='0 0 0 4px rgba(255,255,0,0.5)';
    ...    ARGUMENTS    ${element}
