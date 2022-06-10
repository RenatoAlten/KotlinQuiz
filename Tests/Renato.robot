*** Settings ***
Resource    ../Resources/KotlinQuiz.robot
Test Setup  Begin Android Test
Test Teardown  End Android Test
Library    Process

*** Variables ***
${DEVICE_ID}    emulator-5554 


*** Test Cases ***

Install KotlinQuiz
    
    Install Application
    #Check Application is installed

Check Restore Contexts
    [Tags]    Current
    Change Context
    Restart Application

Select all yes
    
    Change Context
    Click all yes

Test try
    
    Change Context
    Test Test
    
*** Keywords ***    

