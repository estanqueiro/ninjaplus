*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../../resources/lib/db.py
Resource   ../../resources/api/base_api.resource

*** Test Cases ***
Unique Id
    ${user_id}=                         Convert To String    1
    #&{headers}=                        Create Dictionary    Content-Type=application/json
    ${token}=                           Get Admin Token
    ${response}=                        Get User             ${user_id}      ${token}   
    ${code}=                            Convert To String    ${response.status_code}
    Should Be Equal                     ${code}              200
    Dictionary Should Contain Value     ${response.json()}   Paulo Estanqueiro
    Dictionary Should Contain Value     ${response.json()}   estanqueiro@ninjaplus.com

User not found
    ${user_id}=           Convert To String    9999
    #&{headers}=          Create Dictionary    Content-Type=application/json
    ${token}=             Get Admin Token
    ${response}=          Get User             ${user_id}      ${token}
    ${code}=              Convert To String    ${response.status_code}
    Should Be Equal       ${code}              404