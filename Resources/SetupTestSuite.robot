*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Set General Values
    Set Appium Timeout    seconds=15

Finish Tests
    Sleep    3s
    Close Application