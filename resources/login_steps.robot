*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${DEFAULT_URL}    http://ninjaplus-web:5000/login
${BROWSER}        chrome

*** Keywords ***
Abrir navegador
    Open Browser      ${DEFAULT_URL}    ${BROWSER}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

Fechar navegador
    Close Browser

Fazendo login com "${email}" e senha "${pass}"
    Input Text        id:emailId    ${email}
    Input Password    id:passId     ${pass}
    Click Button      id:login

Devo ver o meu nome "${username}" na área logada
    Wait Until Element Contains    css:.user .info span    ${username}

Devo ver a seguinte mensagem de alerta "${expected_message}"
    Wait Until Element Contains    css:.alert    ${expected_message}

Logando com credenciais inválidas devo ver uma mensagem de alerta
    [Arguments]       ${email}      ${pass}       ${expected_message}
    Input Text        id:emailId    ${email}
    Input Password    id:passId     ${pass}
    Click Button      id:login
    Wait Until Element Contains     css:.alert    ${expected_message}