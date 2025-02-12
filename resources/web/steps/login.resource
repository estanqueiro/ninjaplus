*** Settings ***
Resource    ./base.resource

*** Keywords ***
Fazendo login com "${email}" e senha "${pass}"
    Input Text        ${INPUT_EMAIL}    ${email}
    Input Password    ${INPUT_PASS}     ${pass}
    Click Button      ${BUTTON_SUBMIT}

Devo ver o meu nome "${username}" na área logada
    Wait Until Element Contains    ${SPAN_USER}    ${username}

Logando com credenciais inválidas devo ver uma mensagem de alerta
    [Arguments]       ${email}          ${pass}         ${expected_message}
    Input Text        ${INPUT_EMAIL}    ${email}
    Input Password    ${INPUT_PASS}     ${pass}
    Click Button      ${BUTTON_SUBMIT}
    Wait Until Element Contains         ${DIV_ALERT}    ${expected_message}