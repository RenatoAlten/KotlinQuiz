*** Settings ***
Resource        ../Resources/Agnet.robot
Test Setup      Begin Android Test
Test Teardown   End Android Test
Library         Process

*** Variables ***
${DEVICE_ID}    emulator-5554 

*** Test Cases ***

Restart Application
    Restart Application

Change Server Credentials
    Open Settings Context
    Change Server Values
    Change Organization ID

Log in
    [Tags]    Current
    Open Settings Context
    Change Server Values
    Change Organization ID
    Register Organization 

*** Keywords ***    

