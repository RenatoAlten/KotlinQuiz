*** Settings ***
Library    AppiumLibrary
Library    String
Resource    Locations.robot
*** Variables ***

#*** Application Variables ***
${APK_PATH}          ${CURDIR}\\app-debug.apk
${APP-ID}            com.kotlinquiz.app
${APP-ACTIVITY}      com.kotlinquiz.app.ui.splash.SplashActivity

#*** Home Variables ***

${MAIN_FRAME_ID}    id=com.kotlinquiz.app:id/action_bar_root
${MAIN_AVARAR_ID}    id=com.kotlinquiz.app:id/avatarImg

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
Begin Android Test
    Set Appium Timeout    10
    Run Application
    Wait Until Page Contains Element            ${MAIN_AVARAR_ID}

End Android Test
    Sleep    20s
    Close Application

Change Context
    Click Element    ${MAIN_AVARAR_ID}
    Wait Until Page Contains Element            ${AVATAR_OK_ID}
    Click Element    ${AVATAR_OK_ID}
    Wait Until Page Contains Element            ${QUIZ_TITLE_ID}

Restart Application
    Close Application
    Run Application    noReset=true
    Wait Until Page Contains Element            ${QUIZ_TITLE_ID}

Run Application
    [Arguments]     ${noReset}=false
    Open Application   http://localhost:4723/wd/hub    noReset=${noReset}     platformName=Android   deviceName=${DEVICE_ID}  appPackage=${APP-ID}  appActivity=${APP-ACTIVITY}  automationName=Uiautomator2

Test Test
    FOR  ${Index}  IN RANGE  7
    
        ${result}    Catenate    ${QUIZ_CLASS}    [@index=${${Index}}]    ${QUIZ_BUTTON_CLASS}
        Click Element    ${result}            
    END