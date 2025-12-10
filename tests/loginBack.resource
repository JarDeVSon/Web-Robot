*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
Library    DateTime
Library    Process


***Variables***

${USERNAME}    testeback@bol.com 
${PASSWORD}    teste123
&{URL_BACKEND}     dev=urlDEV  hom=https://serverest.dev
${ENVIRONMENT_BACK}  hom

***Keywords***

Inicializar Sessão API
    &{headers}=    Create Dictionary    Content-Type=application/json
    Create Session    api    ${URL_BACKEND.${ENVIRONMENT_BACK}}    headers=${headers}    verify=False    disable_warnings=True    max_retries=3

Finalizar Sessão API
    Delete All Sessions

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
