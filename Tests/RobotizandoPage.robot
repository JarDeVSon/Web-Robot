*** Settings ***

Library     Selenium2Library

Variables   Locators.py
Resource    BDDpt-br.robot


*** Keywords ***
############### DADO  ######################
Que esteja na tela HOME do blog robotizando testes
    Acessar blog robotizandotestes

Que esteja na tela de resultado da pesquisa pela postagem "${TITULO_POSTAGEM}"
    Verificar resultado da pesquisa   ${TITULO_POSTAGEM}

#################### QUANDO #################
Pesquisar pela palavra "${BUSCA}"
    Pesquisar a postagem pela palavra "${BUSCA}"

Clicar no link da postagem
    Clicar no post encontrado

################# ENTÃO #################
A postagem "${TITULO_POSTAGEM}" deve ser listada no resultado da pesquisa
    Verificar resultado da pesquisa   ${TITULO_POSTAGEM}

A tela da postagem "${TITULO_POSTAGEM}" deve ser mostrada
    Verificar tela da postagem  ${TITULO_POSTAGEM}

###########################    PASSOS ############################################

Acessar blog robotizandotestes

    Wait Until Element Is Visible   ${HEADER_CABECALHO}
    Title Should Be     Robotizando Testes

Pesquisar a postagem pela palavra "${BUSCA}"
    Click Element   ${BUTTON_LUPA}
    Input Text      ${CAMPO_PESQUISAR}    ${BUSCA}
    Click Element   ${BOTAO_PESQUISAR}
    Wait Until Element Is Visible   ${LINK_POST}

Verificar resultado da pesquisa
    [Arguments]   ${TITULO_POSTAGEM}
    Page Should Contain     ${TITULO_POSTAGEM}

Clicar no post encontrado
    Click Element    ${LINK_POST}

Verificar tela da postagem
    [Arguments]   ${TITULO_POSTAGEM}
    Wait Until Element Is Visible  ${TITULO}
    Title Should Be  ${TITULO_POSTAGEM}

