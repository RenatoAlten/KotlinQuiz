*** Settings ***
Library    AppiumLibrary
Library    String
Resource    Locations.robot
Resource    Common.robot
*** Variables ***





#*** Avatar Variables ***
${AVATAR_OK_ID}    id=com.kotlinquiz.app:id/btn_ok

#*** Quiz Context ***
${QUIZ_TITLE_ID}    id=com.kotlinquiz.app:id/textView10
${QUIZ_YES_ID}    id=com.kotlinquiz.app:id/check_yes
${QUIZ_CLASS}    //android.widget.FrameLayout
${QUIZ_BUTTON_CLASS}     //android.widget.RadioButton




*** Keywords ***

Install Application
    Install App    ${APK_PATH}     ${APP-ID}

Check Application is installed
    Run Application
Click all yes
    
    Wait Until Page Contains Element            ${QUIZ_YES_ID}
    FOR  ${y_coordinate}  IN  @{QUIZ_YES_LOCATORS}
        Click Element At Coordinates    ${QUIZ_YES_X}     ${y_coordinate}
    END

Change Context
    Click Element    ${MAIN_AVARAR_ID}
    Wait Until Page Contains Element            ${AVATAR_OK_ID}
    Click Element    ${AVATAR_OK_ID}
    Wait Until Page Contains Element            ${QUIZ_TITLE_ID}


Test Test
    FOR  ${Index}  IN RANGE  7
    
        ${result}    Catenate    ${QUIZ_CLASS}    [@index=${${Index}}]    ${QUIZ_BUTTON_CLASS}
        Click Element    ${result}            
    END