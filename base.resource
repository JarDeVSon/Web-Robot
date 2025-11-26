***Settings***

Library    SeleniumLibrary  timeout=20    implicit_wait=20
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
Library    DateTime
Library    Process

Resource    ./resources/loginBack.resource
Resource    ./resources/loginPage.resource

***Variables***
${BROWSER}    headlesschrome
${ENVIRONMENT}  hom
&{URL_LOGIN}    dev=urlDEV  hom=https://front.serverest.dev/login
${USERNAME}    testefront@bol.com 
${PASSWORD}    teste123
${URL_BASE}    https://serverest.dev/#/



