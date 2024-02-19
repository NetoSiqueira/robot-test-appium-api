*** Settings ***

Documentation    Suite de testes do cadastro de tarefas

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${task}    Set Variable    Estudar XPath
    Remove task from database    ${task}

    Do Login
   
   Create a new task    ${task}
   Should have task     ${task}

Deve poder remover tarefa indesejada
    [Tags]    remove
    ${task}    Set Variable    Deve excluir
    Remove task from database    ${task}

    Do Login
    Create a new task    ${task}
    Should have task     ${task}

   Should remove the task    ${task}
    

Deve poder concluir uma tarefa
    [Tags]    done
    ${task}    Set Variable    Estudar Python
    Remove task from database    ${task}

    Do Login
    Create a new task    ${task}
    Should have task     ${task}

   Finish task             ${task}    
   Taske should be done    ${task}