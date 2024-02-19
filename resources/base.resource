*** Settings ***

Documentation        Tudo deve começar nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    screens/login.resource
Resource    screens/tasks.resource

*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...    automationName=uiautomator2
    ...    platformName=Android
    ...    deviceName=Emulador
    ...    udid=RX8NA0HAF1L
    ...    autoGrantPermissions=true
    ...    app=${EXECDIR}/apps/markx.apk

    Wait Until Element Is Visible     xpath=//*[@resource-id="apiIp"]    5

Finish session
    Capture Page Screenshot
    Close Application