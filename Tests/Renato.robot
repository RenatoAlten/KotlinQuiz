*** Settings ***
Resource    ../Resources/KotlinQuiz.robot
Test Setup  Begin Android Test
Test Teardown  End Android Test

*** Variables ***
${DEVICE_ID}    emulator-5554 


*** Test Cases ***

Install KotlinQuiz
    
    Install Application
    #Check Application is installed

Check Restore Contexts
    Change Context
    Restart Application

Select all yes
    
    Change Context
    Click all yes

Test try
    [Tags]    Current
    Change Context
    Test Test
    
*** Keywords ***