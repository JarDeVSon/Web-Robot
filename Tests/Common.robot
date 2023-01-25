*** Settings ***

Library    SeleniumLibrary
Library    Screenshot

*** Variable ***
${BROWSER}              chrome
${URL}                  https://robotizandotestes.blogspot.com.br/

*** Keywords ***
Abrir Navegador
    Open Browser  ${URL}  ${BROWSER}  timeout=10
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot  EMBED
    Close Browser