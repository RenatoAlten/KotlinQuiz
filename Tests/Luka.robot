*** Settings ***
Resource    ../Resources/KotlinQuizApp.robot
Resource    ../Resources/SetupTestSuite.robot
Test Setup     Set General Values
Test Teardown   Finish Tests
#Suite Setup     Set General Values
#Suite Teardown     Finish Tests

*** Test Cases ***
Start Application
    [Tags]    open
    Open KotlinQuizz Application
    Open An Avatar

Complete The Quizz
    [tags]    second
    Restore Application
    Check The Quizz Responses