***Settings***

Resource    ../../base.resource

***Keywords***

Inicializar Sessão API
    &{headers}=    Create Dictionary    Content-Type=application/json
    Create Session    api    ${URL_BACKEND.${ENVIRONMENT_BACK}}    headers=${headers}    verify=False    disable_warnings=True    max_retries=3

Realizar Login com Credenciais
    [Arguments]    ${email}    ${password}

    ${BODY}=    Create Dictionary    email=${email}    password=${password}
    ${RESPONSE}=    POST On Session    
    ...    alias=api    
    ...    url=/login    
    ...    json=${BODY}    
    ...    expected_status=ANY 
    
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

    Should Be Equal As Integers    ${RESPONSE}    ${STATUS_CODE}
    RETURN    ${RESPONSE}
