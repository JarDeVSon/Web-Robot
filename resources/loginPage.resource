***Settings***

Resource    ../base.resource


***Keywords***

Acesso a pagina de login
    Open Browser  ${URL_LOGIN.${ENVIRONMENT}}  ${BROWSER}
    Maximize Browser Window

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

Fechar Navegador
    Capture Page Screenshot  EMBED
    Close Browser
