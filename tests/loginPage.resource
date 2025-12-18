*** Settings ***
Library    SeleniumLibrary  timeout=20    implicit_wait=20
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

*** Variables ***
&{login_page_locators}=
...    email_field=css:#email
...    password_field=css:#password
...    login_button=xpath://button[@data-testid="entrar"]

*** Keywords ***

Highlight Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    60s
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].style.border='4px solid red';
    ...    arguments[0].style.backgroundColor='yellow';
    ...    ARGUMENTS    ${element}

Acesso a pagina de login

    Open Browser  ${URL_LOGIN.${ENVIRONMENT_FRONT}}  ${BROWSER}
    Maximize Browser Window

Preencho formulario de login
    [Arguments]    ${username}    ${password}
            
    Input Text    ${login_page_locators.email_field}  ${username}
    Highlight Element    ${login_page_locators.email_field}
    Input Text    ${login_page_locators.password_field}    ${password}
    Highlight Element    ${login_page_locators.password_field}


Clico no botao login
    Click Element    ${login_page_locators.login_button}
    Highlight Element    ${login_page_locators.login_button}

Valido que estou logado
    [Arguments]    ${message}
    Wait Until Page Contains Element    locator=xpath://h1[contains(text(),'${message}')]
    Highlight Element    xpath://h1[contains(text(),'${message}')]


Valido mensagem de erro
    [Arguments]    ${message}
    Wait Until Page Contains Element    locator=//*[contains(text(), '${message}')]
    Highlight Element    xpath://*[contains(text(),'${message}')]

Fechar Navegador
    Capture Page Screenshot  EMBED    
    Close Browser
