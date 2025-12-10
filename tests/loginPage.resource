*** Settings ***
Library    SeleniumLibrary  timeout=20    implicit_wait=20
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
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

***Keywords***

Acesso a pagina de login
    Open Browser  ${URL_LOGIN.${ENVIRONMENT_FRONT}}  ${BROWSER}
    Maximize Browser Window

Preencho formulario de login
    [Arguments]    ${username}    ${password}
    Input Text    ${login_page_locators.email_field}  ${username}
    Input Text    ${login_page_locators.password_field}    ${password}

Clico no botao login
    Click Element    ${login_page_locators.login_button}

Valido que estou logado
    [Arguments]    ${message}
    Wait Until Page Contains      ${message}

Valido mensagem de erro
    [Arguments]    ${message}
    Wait Until Page Contains    ${message}

Fechar Navegador
    Run Keyword IF Test Failed  Capture Page Screenshot  EMBED    
    Close Browser
