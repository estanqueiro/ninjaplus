*** Settings ***
Documentation    Formulário de cadastro de filme
Resource    ../../resources/web/steps/base.resource
Resource    ../../resources/web/steps/cadastro.resource

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
# robot -d ./results ./specs/web/cadastro.robot
Cadastro de um novo filme com sucesso
    Dado que estou logado com credenciais validas
    Quando eu faço o cadastro de um novo filme
    Entao esse filme deve ser exibido na lista