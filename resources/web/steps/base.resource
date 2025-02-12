*** Settings ***
Library     String
Library     SeleniumLibrary
Resource    ../elements.resource

*** Variables ***
${DEFAULT_URL}        http://ninjaplus-web:5000/login
${BROWSER}            chrome

*** Keywords ***
Abrir navegador
    Open Browser      ${DEFAULT_URL}    ${BROWSER}
    Set Selenium Implicit Wait    10
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser