*** Settings ***
Resource    ../tests/utils.resource

*** Variables ***
&{login_page_locators}=
...    email_field=css:#email
...    password_field=css:#password
...    login_button=xpath://button[@data-testid="entrar"]

*** Keywords ***

Acesso a pagina de login

    Open Browser  ${URL_LOGIN.${ENVIRONMENT_FRONT}}  ${BROWSER}    
    Set Window Size    1920    1080

Preencho formulario de login
    [Arguments]    ${username}    ${password}
            
    Highlight Element And Input Text    ${login_page_locators.email_field}    ${username}
    Highlight Element And Input Text    ${login_page_locators.password_field}    ${password}

Clico em login

    Highlight Element And Click    ${login_page_locators.login_button}

Valido que estou logado
    [Arguments]    ${message} 

    Highlight Element And Wait Until Page Contains Element    //*[contains(text(),'${message}')]    ${message}

Valido mensagem de erro
    [Arguments]    ${message}

    Highlight Element And Wait Until Page Contains Element    //*[contains(text(), '${message}')]    ${message}

Fechar Navegador
    Capture Page Screenshot  EMBED    
    Close Browser
