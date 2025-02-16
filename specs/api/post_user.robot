*** Settings ***
Library    RequestsLibrary
Library    Collections
#Library    OperatingSystem
Library    ../../resources/lib/db.py
Resource   ../../resources/api/base_api.resource

*** Test Cases ***
Create a new user
    Remove User By Email                bruce@wayne.com
    #${body}=                           Get File             ${EXECDIR}/resources/json/post_200.json
    &{body}=                            Create Dictionary    full_name=Bruce Wayne    email=bruce@wayne.com    password=pwd123
    #&{headers}=                        Create Dictionary    Content-Type=application/json
            
    ${response}=                        Post User            ${body}
    ${code}=                            Convert To String    ${response.status_code}
    Should Be Equal                     ${code}              200

Name required
    Create Session                      ${SESSION}           ${ENDPOINT}
    &{body}=                            Create Dictionary    full_name=${EMPTY}    email=bruce@wayne.com     password=pwd123
    #&{headers}=                        Create Dictionary    Content-Type=application/json
            
    ${response}=                        Post User            ${body}
    ${code}=                            Convert To String    ${response.status_code}
    Should Be Equal                     ${code}              412
    Dictionary Should Contain Value     ${response.json()}   Validation notEmpty on full_name failed

Email required
    Create Session                      ${SESSION}           ${ENDPOINT}
    &{body}=                            Create Dictionary    full_name=Bruce Wayne    email=${EMPTY}         password=pwd123
    #&{headers}=                        Create Dictionary    Content-Type=application/json
            
    ${response}=                        Post User            ${body}
    ${code}=                            Convert To String    ${response.status_code}
    Should Be Equal                     ${code}              412
    Dictionary Should Contain Value     ${response.json()}   Validation notEmpty on email failed

Password required
    Create Session                      ${SESSION}           ${ENDPOINT}   
    &{body}=                            Create Dictionary    full_name=Bruce Wayne    email=bruce@wayne.com   password=${EMPTY} 
    
    ${response}=                        Post User            ${body}
    ${code}=                            Convert To String    ${response.status_code}
    Should Be Equal                     ${code}              412
    Dictionary Should Contain Value     ${response.json()}   Validation notEmpty on password failed