***Settings***
Resource    ../common.resource

***Keywords***

Inicializar Sessão API
    &{headers}=    Create Dictionary    Content-Type=application/json
    Create Session    api    ${URL_BASE}    headers=${headers}    verify=False    disable_warnings=True

Realizar Login com Credenciais
    [Arguments]    ${email}    ${password}
    ${BODY}=    Create Dictionary    email=${email}    password=${password}

    ${RESPONSE}=    POST On Session    api    /login    json=${BODY}
    
    # Converte resposta em JSON
    ${json}=   Convert String To Json    ${RESPONSE.text}

    # Extrai o campo href
    ${href}=    Get Value From Json    ${json}    $.links.href
    ${HREF_STRING}=    Convert To String    ${href}

    Log To Console    Href capturado: ${href}
    Log To Console    Href capturado (string): ${HREF_STRING}
    Set Global Variable    ${href}

    # 2º POST - usa o href como rota
    ${response2}=   Post On Session    api    ${href}    json={"confirmacao": true}
    Should Be Equal As Integers    ${response2.status_code}    200
    Log    ${response2.text}
    Set Global Variable    ${RESPONSE}
    RETURN    ${RESPONSE}

    
Validar Login Bem-Sucedido
    [Arguments]    ${RESPONSE}    ${CAMPO}    ${VALOR}
    Dictionary Should Contain Item    ${RESPONSE}    ${CAMPO}    ${VALOR}

    RETURN    ${RESPONSE}
      


Validar Falha no Login
    [Arguments]    ${RESPONSE}    ${CAMPO}    ${VALOR}
    Dictionary Should Contain Item    ${RESPONSE}    ${CAMPO}    ${VALOR}

    RETURN    ${RESPONSE}


Validar status code
    [Arguments]    ${RESPONSE}    ${STATUS_CODE}
    Should Be Equal    ${RESPONSE}    ${STATUS_CODE}

    RETURN    ${RESPONSE}
