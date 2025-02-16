*** Settings ***
Library        RequestsLibrary
Library        ../..//resources/lib/db.py

*** Variables ***
${SESSION}        nplus
${ENDPOINT}       http://ninjaplus-api:3000
${ROUTE_AUTH}     /auth
${ROUTE_USER}     /user

*** Keywords ***
Get Admin Token
    Create Session          ${SESSION}           ${ENDPOINT}
    &{body}=                Create Dictionary    email=estanqueiro@ninjaplus.com    password=pwd123
    ${response}=            POST On Session      ${SESSION}     ${ROUTE_AUTH}       data=${body}    expected_status=anything   
    ${token}=               Convert To String    JWT ${response.json()['token']}
    RETURN                  ${token}

Get User Token
    [Arguments]             ${body}
    Create Session          ${SESSION}           ${ENDPOINT}
    ${response}=            POST On Session      ${SESSION}     ${ROUTE_AUTH}       data=${body}    expected_status=anything   
    ${token}=               Convert To String    JWT ${response.json()['token']}
    RETURN                  ${token}


Get User
    [Arguments]             ${user_id}           ${token}
    Create Session          ${SESSION}           ${ENDPOINT}
    &{headers}=             Create Dictionary    Content-Type=application/json     Authorization=${token}

    ${response}=            GET On Session       ${SESSION}    ${ROUTE_USER}/${user_id}    headers=${headers}    expected_status=anything
    RETURN                  ${response}

Post User
    [Arguments]             ${body}
    Create Session          ${SESSION}           ${ENDPOINT}
    &{headers}=             Create Dictionary    Content-Type=application/json
    ${response}=            POST On Session      ${SESSION}    ${ROUTE_USER}    data=${body}    expected_status=anything
    RETURN                  ${response}

Post User Return Id
    [Arguments]             ${body}
    Create Session          ${SESSION}           ${ENDPOINT}
    &{headers}=             Create Dictionary    Content-Type=application/json
    ${response}=            POST On Session      ${SESSION}    ${ROUTE_USER}    data=${body}    expected_status=anything
    ${user_id}=             Convert To String    ${response.json()['id']}
    RETURN                  ${user_id}

Delete User
    [Arguments]             ${user_id}   
    ${token}=               Get Admin Token
    Create Session          ${SESSION}             ${ENDPOINT}
    &{headers}=             Create Dictionary      Content-Type=application/json             Authorization=${token}
    ${response}=            DELETE On Session      ${SESSION}    ${ROUTE_USER}/${user_id}    headers=${headers}    expected_status=anything
    RETURN                  ${response}

Put User
    [Arguments]             ${user_id}             ${token}
    Create Session          ${SESSION}             ${ENDPOINT}
    ${body}=                Create Dictionary      full_name=Paulo Estanqueiro               email=estanqueiro@outlook.com    password=pwd123
    &{headers}=             Create Dictionary      Content-Type=application/json             Authorization=${token}
    ${response}=            PUT On Session         ${SESSION}    ${ROUTE_USER}/${user_id}    json=${body}     headers=${headers}    expected_status=anything   
    RETURN                  ${response}