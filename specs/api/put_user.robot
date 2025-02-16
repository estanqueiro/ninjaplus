*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     ../../resources/lib/db.py
Resource    ../../resources/api/base_api.resource


*** Test Cases ***
Update a user
    Remove User By Email    estanqueiro@yahoo.com
    Remove User By Email    estanqueiro@outlook.com
    &{user}=                Create Dictionary      full_name=Estanqueiro        email=estanqueiro@yahoo.com    password=pwd123
    ${user_id}=             Post User Return Id    ${user}
    
    ${token}=               Get User Token         ${user}
    ${response}=            Put User               ${user_id}                   ${token}   
    ${code}=                Convert To String      ${response.status_code}
    Should Be Equal         ${code}                200
              
    ${user}=                Get User               ${user_id}                   ${token}
    Dictionary Should Contain Value                ${user.json()}               Paulo Estanqueiro
    Should Be Equal                                ${user.json()['email']}      estanqueiro@outlook.com
