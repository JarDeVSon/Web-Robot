***Settings***

Resource    loginBack.resource
Test Tags    back

Test Setup    Run Keywords
...   Inicializar Sessão API

Test Teardown    Run Keywords
...   Finalizar Sessão API


***Test Cases***

Cenário 1: Login com Credenciais Válidas

    ${RESPONSE}    Realizar Login com Credenciais    ${USERNAME_BACK}  ${PASSWORD_BACK}
    Validar status code  ${RESPONSE.status_code}    200
    Validar Login Bem-Sucedido    ${RESPONSE.json()}    message    Login realizado com sucesso

Cenário 2: Login com Senha Inválida

    ${RESPONSE}    Realizar Login com Credenciais    testeback@bol.com    senha_incorreta
    Validar status code  ${RESPONSE.status_code}    401
    Validar Falha no Login    ${RESPONSE.json()}    message    Email e/ou senha inválidos

Cenário 3: Login com Email Inexistente
    
    ${RESPONSE}    Realizar Login com Credenciais    email_inexistente@qa.com.br    qualquersenha
    Validar status code  ${RESPONSE.status_code}    401
    Validar Falha no Login    ${RESPONSE.json()}    message    Email e/ou senha inválidos
