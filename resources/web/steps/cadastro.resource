*** Settings ***
Resource    ./base.resource
Library     ../../lib/db.py

*** Variables ***
# DataTest
${Title}          Resident Evil
${Status}         Disponível
${Year}           2002
${ReleaseDate}    01/12/2002
@{Cast}           Milla Jovovich    Ali Larter    Ian Glen    Shawn Roberts
${Plot}           Alice tem a missao de desativar a rainha vermelha na colmeia porque alguem jogou um virus e deu ruim

*** Keywords ***
Dado que estou logado com credenciais validas
    Input Text        ${INPUT_EMAIL}       estanqueiro@ninjaplus.com
    Input Password    ${INPUT_PASS}        pwd123
    Click Button      ${BUTTON_SUBMIT}

Quando eu faço o cadastro de um novo filme
    Remove Movie By Title              ${title}
    Click Button                       ${BUTTON_ADD}
    Input Text                         ${INPUT_TITLE}        ${Title}
    Click Element                      ${DROP_STATUS}
    Wait Until Element Is Visible      ${OPTION_AVAILABLE}
    Click Element                      ${OPTION_AVAILABLE}
    Input Text                         ${INPUT_YEAR}         ${Year}
    Input Text                         ${INPUT_RDATE}        ${ReleaseDate}
    FOR    ${actor}    IN    @{Cast}
        Input Text    ${INPUT_CAST}    ${actor}
        Press Keys    ${INPUT_CAST}    TAB
        Log           ${actor}
    END
    Input Text                         ${TEXT_PLOT}          ${Plot}
    Click Button      ${BUTTON_SAVE}
    
Entao esse filme deve ser exibido na lista
    Wait Until Element Contains    ${TABLE_ITEM}    ${Title}