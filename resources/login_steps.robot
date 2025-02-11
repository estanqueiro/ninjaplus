*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Fazendo login com "${email}" e senha "${pass}"
    Open Browser      http://ninjaplus-web:5000/login    chrome
    Input Text        id:emailId    ${email}
    Input Password    id:passId     ${pass}
    Click Button      id:login
    Sleep    5

Devo ver o meu nome "${username}" na área logada
    Page Should Contain    ${username}
    Close Browser