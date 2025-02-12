*** Settings ***
Documentation    O usuário informa suas credenciais e vai para a área logada
Resource         ../../resources/web/steps/login.resource

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
# robot -d ./results ./specs/web/login_com_sucesso.robot
Login com sucesso
    Fazendo login com "estanqueiro@ninjaplus.com" e senha "pwd123"
    Devo ver o meu nome "Paulo Estanqueiro" na área logada