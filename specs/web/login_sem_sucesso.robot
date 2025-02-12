*** Settings ***
Documentation     O usuário informa credenciais incorretas e é notificado com uma mensagem de alerta
Resource          ../../resources/web/steps/login.resource
Test Template     Logando com credenciais inválidas devo ver uma mensagem de alerta

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
# robot -d ./results ./specs/web/login_sem_sucesso.robot
Senha inválida              estanqueiro@ninjaplus.com    asdfg       Usuário e/ou senha inválidos
Usuário não cadastra        padrekevedo@nokziste.com     pwd123      Usuário e/ou senha inválidos
Email deve ser requerido    ${EMPTY}                     pwd123      Opps. Cadê o email?
Senha deve ser requerido    estanqueiro@ninjaplus.com    ${EMPTY}    Opps. Cadê a senha?