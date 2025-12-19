*** Settings ***
Library    SeleniumLibrary  timeout=20    implicit_wait=20    page_load_timeout=20    run_on_failure=Capture Page Screenshot


***Variables***
${BROWSER}    headlesschrome
${ENVIRONMENT_FRONT}  hom
&{URL_LOGIN}    dev=urlDEV  hom=https://front.serverest.dev/login
${USERNAME}    testefront@bol.com 
${PASSWORD}    teste123

*** Keywords ***

Highlight Element And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].style.outline='3px solid red';
    ...    arguments[0].style.outlineOffset='2px';
    ...    arguments[0].style.boxShadow='0 0 0 4px rgba(255,255,0,0.5)';
    ...    ARGUMENTS    ${element}
    Input Text    ${locator}    ${text}

Highlight Element And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].style.outline='3px solid red';
    ...    arguments[0].style.outlineOffset='2px';
    ...    arguments[0].style.boxShadow='0 0 0 4px rgba(255,255,0,0.5)';
    ...    ARGUMENTS    ${element}
    Click Element    ${locator}    

Highlight Element And Wait Until Page Contains Element
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].style.outline='3px solid red';
    ...    arguments[0].style.outlineOffset='2px';
    ...    arguments[0].style.boxShadow='0 0 0 4px rgba(255,255,0,0.5)';
    ...    ARGUMENTS    ${element}
    Wait Until Element Contains    ${locator}    ${text}