***Settings***
Library    SeleniumLibrary  timeout=10    implicit_wait=10
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
Library    DateTime
Library    BuiltIn
Library    Process


Resource   resources/loginPage.resource
Resource   resources/LoginBack.resource

***Variables***
${BROWSER}    chrome
${URL}    https://front.serverest.dev/login
${USERNAME}    testefront@bol.com 
${PASSWORD}    teste123
${URL_BASE}    https://serverest.dev/#/

