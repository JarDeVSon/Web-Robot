*** Settings ***

Library    SeleniumLibrary

*** Variable ***
${BROWSER}              chrome
${URL}                  https://robotizandotestes.blogspot.com.br/

*** Keywords ***
Abrir Navegador
    Open Browser  ${URL}  ${BROWSER}

Fechar Navegador
    Close Browser