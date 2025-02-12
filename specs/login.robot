*** Settings ***
Documentation    O usuário informa suas credenciais e vai para a área logada
Resource         ../resources/login_steps.robot

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
# robot -d results specs
Login com sucesso
    Fazendo login com "estanqueiro@ninjaplus.com" e senha "pwd123"
    Devo ver o meu nome "Paulo Estanqueiro" na área logada

Email deve ser requerido
    Fazendo login com "" e senha "pwd123"
    Devo ver a seguinte mensagem de alerta "Opps. Cadê o email?"

Senha deve ser requerido
    Fazendo login com "estanqueiro@ninjaplus.com" e senha ""
    Devo ver a seguinte mensagem de alerta "Opps. Cadê a senha?"