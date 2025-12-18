*** Settings ***
Library    SeleniumLibrary  timeout=90    implicit_wait=90    run_on_failure=Capture Page Screenshot
Library    Collections
Library    String
Library    OperatingSystem
Library    DateTime
Library    Process
Resource    ../tests/utils.resource

*** Variables ***
&{login_page_locators}=
...    email_field=css:#email
...    password_field=css:#password
...    login_button=xpath://button[@data-testid="entrar"]

*** Keywords ***

Acesso a pagina de login

    Open Browser  ${URL_LOGIN.${ENVIRONMENT_FRONT}}  ${BROWSER}    
    Maximize Browser Window

Preencho formulario de login
    [Arguments]    ${username}    ${password}
            
    Highlight Element And Input Text    ${login_page_locators.email_field}    ${username}
    Highlight Element And Input Text    ${login_page_locators.password_field}    ${password}

Clico no botao login

    Highlight Element And Click    ${login_page_locators.login_button}

Valido que estou logado
    [Arguments]    ${message}

    Highlight Element And Wait Until Page Contains Element    //h1[contains(text(),'${message}')]    ${message}

Valido mensagem de erro
    [Arguments]    ${message}

    Highlight Element And Wait Until Page Contains Element    //*[contains(text(), '${message}')]    ${message}
    
Fechar Navegador
    Capture Page Screenshot  EMBED    
    Close Browser
