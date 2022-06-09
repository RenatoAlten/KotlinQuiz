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

*** Keywords ***

Begin Android Test
    Set Appium Timeout    10
    Open Application   http://localhost:4723/wd/hub    platformName=Android   deviceName=${DEVICE_ID}        appPackage=${APP-ID}  appActivity=${APP-ACTIVITY}  automationName=Uiautomator2
    Wait Until Page Contains Element            ${MAIN_FRAME_ID}

End Android Test
    Sleep    1

Change Context
    Click Element    ${MAIN_AVARAR_ID}


