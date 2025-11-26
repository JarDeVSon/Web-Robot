Language: Brazilian Portuguese

***Settings***

Resource    ../base.resource
Resource    ../resources/loginPage.resource

Test Setup    Dado Acesso a pagina de login
Test Teardown    Fechar Navegador

***Test Cases***

Caso de Teste 1: Login com credenciais válidas
    [Tags]    login    valido

    Quando Preencho formulario de login    ${USERNAME}    ${PASSWORD}
    E Clico no botao login
    Então Valido que estou logado    Home


Caso de Teste 2: Login com credenciais inválidas
    [Tags]    login    invalido

    Quando Preencho formulario de login    usuario_invalido@email.com    senha_invalida
    E Clico no botao login
    Então Valido mensagem de erro    Email e/ou senha inválidos
    

Caso de Teste 3: Campo email vazio
    [Tags]    login    invalido

    Quando Preencho formulario de login    ${EMPTY}    ${PASSWORD}
    E Clico no botao login
    Então Valido mensagem de erro    Email é obrigatório  