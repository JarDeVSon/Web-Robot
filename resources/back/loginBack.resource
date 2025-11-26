***Settings***

Library    SeleniumLibrary  timeout=20    implicit_wait=20
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
Library    DateTime
Library    Process

***Variables***
&{URL_BACKEND}     dev=urlDEV  hom=https://serverest.dev
${ENVIRONMENT}  hom


***Keywords***

Inicializar Sessão API
    &{headers}=    Create Dictionary    Content-Type=application/json
    Create Session    api    ${URL_BACKEND.${ENVIRONMENT}}    headers=${headers}    verify=False    disable_warnings=True

Realizar Login com Credenciais
    [Arguments]    ${email}    ${password}

    ${BODY}=    Create Dictionary    email=${email}    password=${password}

    ${RESPONSE}=    POST On Session    api    /login    json=${BODY}  
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

    Should Be Equal As Integers    ${RESPONSE}    ${STATUS_CODE}
    RETURN    ${RESPONSE}
