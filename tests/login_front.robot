Language: Brazilian Portuguese

***Settings***
Resource    ../common.resource

Test Setup    Acesso a pagina de login
Test Teardown    Close Browser

***Test Cases***

Caso de Teste 1: Login com credenciais válidas
    [Tags]    login    valido

    Dado Preencho formulario de login    ${USERNAME}    ${PASSWORD}
    Quando Clico no botao login
    Então Valido que estou logado    Home

Caso de Teste 2: Login com credenciais inválidas
    [Tags]    login    invalido

    Dado Preencho formulario de login    usuario_invalido@email.com    senha_invalida
    Quando Clico no botao login
    Então Valido mensagem de erro    Email e/ou senha inválidos

Caso de Teste 3: Campo email vazio
    [Tags]    login    invalido
    
    Dado Preencho formulario de login    ${EMPTY}    ${PASSWORD}
    Quando Clico no botao login
    Então Valido mensagem de erro    Email é obrigatório  