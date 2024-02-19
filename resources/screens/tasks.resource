*** Settings ***
Documentation    Elementos e acoes da tela minhas tarefas

Library    AppiumLibrary

*** Variables ***
${NEW_TASK_INPUT}    xpath=//*[@resource-id="newTask"]
${CREATE_BNT}        xpath=//*[@resource-id="createTask"]
${BNT_REMOVE}        xpath=//*[@resource-id="android:id/button2"][@text="SIM"]

*** Keywords ***
Create a new task
    [Arguments]    ${task_name}
     Wait Until Element Is Visible    ${NEW_TASK_INPUT}    5

    Input Text       ${NEW_TASK_INPUT}        ${task_name}
    Click Element    ${CREATE_BNT}

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${task_name}"]    5

Should remove the task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..//..//*[@resource-id="removeTask"]

    Wait Until Element Is Visible    ${BNT_REMOVE}    5    
    Click Element   ${BNT_REMOVE}
    
    Wait Until Page Does Not Contain    ${task_name}    5

Finish task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..

Taske should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView   