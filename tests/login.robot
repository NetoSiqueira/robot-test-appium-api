*** Settings ***

Documentation        Teste no login

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com sucesso

    Do Login
    Wait Until Page Contains    Minhas tarefas    5
    
    
    