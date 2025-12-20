Language: Brazilian Portuguese

***Settings***

Resource    loginPage.resource

Test Setup    Run Keywords
...   Acesso a pagina de login

Test Teardown    Run Keywords
...   Fechar Navegador

Test Tags    front

***Test Cases***

Caso de Teste 1: Login com credenciais válidas

    Quando Preencho formulario de login    ${USERNAME_FRONT}    ${PASSWORD_FRONT}
    E Clico no botao login
    Então Valido que estou logado    Home


Caso de Teste 2: Login com credenciais inválidas

    Quando Preencho formulario de login    usuario_invalido@email.com    senha_invalida
    E Clico no botao login
    Então Valido mensagem de erro    Email e/ou senha inválidos
    

Caso de Teste 3: Campo email vazio

    Quando Preencho formulario de login    ${EMPTY}    ${PASSWORD_FRONT}
    E Clico no botao login
    Então Valido mensagem de erro    Email é obrigatório  