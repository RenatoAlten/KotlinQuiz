*** Settings ***
Library    AppiumLibrary
*** Variables ***

#*** Application Variables ***
${APK_PATH}          apk/app-debug.apk
${APP-ID}            com.kotlinquiz.app
${APP-ACTIVITY}      com.kotlinquiz.app.ui.splash.SplashActivity

#*** Home Variables ***

${MAIN_FRAME_ID}    id=com.kotlinquiz.app:id/action_bar_root
${MAIN_AVARAR_ID}    id=com.kotlinquiz.app:id/avatarImg

#*** Avatar Variables ***
${AVATAR_OK_ID}    id=com.kotlinquiz.app:id/btn_ok

#*** Quiz Context ***
${QUIZ_TITLE_ID}    id=com.kotlinquiz.app:id/textView10


*** Keywords ***

Begin Android Test
    Set Appium Timeout    10
    Run Application
    Wait Until Page Contains Element            ${MAIN_AVARAR_ID}

End Android Test
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



