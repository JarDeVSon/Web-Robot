***Settings***
Resource    ../common.resource

Test Setup    Inicializar Sessão API


***Test Cases***

Cenário 1: Login com Credenciais Válidas
    [Tags]    login    valido
    ${RESPONSE}    Realizar Login com Credenciais    testefront@bol.com  teste123
    Validar status code  ${RESPONSE.status_code}    200
    Validar Login Bem-Sucedido    ${RESPONSE.json()}    message    Login realizado com sucesso

Cenário 2: Login com Senha Inválida
    [Tags]    login    invalido
    ${RESPONSE}    Realizar Login com Credenciais    invalido@qa.com.br    senhaerrada
    Validar status code  ${RESPONSE.status_code}    401
    Validar Falha no Login    ${RESPONSE.json()}    message    Email e/ou senha inválidos

Cenário 3: Login com Email Inexistente
    [Tags]    login    invalido
    ${RESPONSE}    Realizar Login com Credenciais    email_inexistente@qa.com.br    qualquersenha
    Validar status code  ${RESPONSE.status_code}    401
    Validar Falha no Login    ${RESPONSE.json()}    message    Email e/ou senha inválidos
