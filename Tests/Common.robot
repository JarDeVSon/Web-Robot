*** Settings ***

Library    SeleniumLibrary
Library    Screenshot

*** Variable ***
${BROWSER}              chrome
${URL}                  https://robotizandotestes.blogspot.com.br/

*** Keywords ***
Abrir Navegador
    Open Browser  ${URL}  ${BROWSER}

Fechar Navegador
    Capture Page Screenshot     screenshot.PNG
    Close Browser