*** Settings ***

Documentation    Elementos e ações da tela de login

Library    AppiumLibrary

*** Variables ***
${API_IP}       192.168.0.7
${CAMPO_IP}     xpath=//*[@resource-id="apiIp"]
${BNT_ENTER}    xpath=//*[@resource-id="signInButton"]



*** Keywords ***

Do Login
    Input Text       ${CAMPO_IP}        ${API_IP}
    Click Element    ${BNT_ENTER}