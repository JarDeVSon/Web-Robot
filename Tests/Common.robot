*** Settings ***

Library    SeleniumLibrary
Library    Screenshot

*** Variables ***
${BROWSER}              chrome
${ENVIRONMENT}          hom
&{URL}                  dev=urlDEV  hom=https://robotizandotestes.blogspot.com.br/

*** Keywords ***
Abrir Navegador
    Open Browser  ${URL.${ENVIRONMENT}}  ${BROWSER}  timeout=10
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot  EMBED
    Close Browser