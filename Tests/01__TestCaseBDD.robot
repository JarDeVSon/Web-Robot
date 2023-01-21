*** Settings ***
Documentation   BDD with Page Objects in RobotFramework by Jardeson Santos

Resource        BDDpt-br.robot
Resource        RobotizandoPage.robot
Resource        Common.robot
Variables       Locators.py

Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Cases ***

Cenário 01: Pesquisar postagem Season Premiere
    [Documentation]     ~~ Breve descricao do teste! Pesquisar postagem ~~
    [Tags]  Smoke

    Dado Que esteja na tela HOME do blog robotizando testes
    Quando Pesquisar pela palavra "introdução"
    Então a postagem "Season Premiere: Introdução ao Robot Framework" deve ser listada no resultado da pesquisa
