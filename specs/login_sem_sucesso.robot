*** Settings ***
Documentation    O usuário informa credenciais incorretas e é notificado com uma mensagem de alerta
Resource         ../resources/login_steps.robot
Test Template    Logando com credenciais inválidas devo ver uma mensagem de alerta

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
# robot -d results specs
Senha inválida          estanqueiro@ninjaplus.com    asdfg     Usuário e/ou senha inválidos
Usuário não cadastra    padrekevedo@nokziste.com     pwd123    Usuário e/ou senha inválidos