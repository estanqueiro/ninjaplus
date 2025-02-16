*** Settings ***
Library    RequestsLibrary
#Library    JSONLibrary
Library    Collections
Library    ../../resources/lib/db.py
Resource   ../../resources/api/base_api.resource

*** Test Cases ***
Unique Id
    Remove User By Email    estanqueiro@yahoo.com
    &{user}=                Create Dictionary        full_name=Estanqueiro    email=estanqueiro@yahoo.com    password=pwd123
    ${user_id}=             Post User Return Id      ${user}
    ${response}=            Delete User              ${user_id}   
    ${code}=                Convert To String        ${response.status_code}
    Should Be Equal         ${code}                  204

User not found
    ${user_id}=             Convert To String        9999
    ${response}=            Delete User              ${user_id}   
    ${code}=                Convert To String        ${response.status_code}
    Should Be Equal         ${code}                  404