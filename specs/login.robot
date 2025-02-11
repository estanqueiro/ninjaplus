*** Settings ***
Documentation    O usuário informa suas credenciais de acesso e submete o formulário de login
Resource    ../resources/login_steps.robot

*** Test Cases ***
# robot -d results specs
Login com sucesso
    Fazendo login com "estanqueiro@ninjaplus.com" e senha "pwd123"
    Devo ver o meu nome "Paulo Estanqueiro" na área logada