*** Settings ***
Library    SeleniumLibrary  timeout=20    implicit_wait=20
Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    JSONLibrary
Library    DateTime
Library    Process

***Variables***
${BROWSER}    headlesschrome
${ENVIRONMENT_FRONT}  hom
&{URL_LOGIN}    dev=urlDEV  hom=https://front.serverest.dev/login

${USERNAME}    testefront@bol.com 
${PASSWORD}    teste123
&{URL_BACKEND}     dev=urlDEV  hom=https://serverest.dev
${ENVIRONMENT_BACK}  hom