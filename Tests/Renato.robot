*** Settings ***
Resource    ../Resources/KotlinQuiz.robot
Test Setup  Begin Android Test
Test Teardown  End Android Test
*** Variables ***
${DEVICE_ID}    emulator-5554 


*** Test Cases ***
Check Restore Contexts
    Change Context
    
*** Keywords ***