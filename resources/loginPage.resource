***Settings***
Resource    ../common.resource

***Keywords***

Acesso a pagina de login
    Open Browser    ${URL}    browser=${BROWSER}

Preencho formulario de login
    [Arguments]    ${username}    ${password}
    Input Text    css:#email    ${username}
    Input Text    css:#password    ${password}

Clico no botao login
    Click Element    css:button[data-testid='entrar']

Valido que estou logado
    [Arguments]    ${message}
    Wait Until Page Contains      ${message}
Valido mensagem de erro
    [Arguments]    ${message}
    Wait Until Page Contains    ${message} 