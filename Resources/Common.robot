*** Comments ***
*** Settings ***
Library    AppiumLibrary
Library    Process

*** Variables ***
#*** Home Variables ***
${MAIN_FRAME_ID}        id=com.kotlinquiz.app:id/action_bar_root
${MAIN_AVARAR_ID}       id=com.kotlinquiz.app:id/avatarImg
#*** Quiz Context ***
${QUIZ_TITLE_ID}    id=com.kotlinquiz.app:id/textView10
#*** Application Variables ***
${APK_PATH}          ${CURDIR}\\app-debug.apk
${APP-ID}            com.kotlinquiz.app
${APP-ACTIVITY}      com.kotlinquiz.app.ui.splash.SplashActivity
${MVI_ID}            com.example.testmviandmockito.ux.main.MainActivity
${MOCKO_PACKAGE}     com.example.testmviandmockito
${DEVICE_ID}    emulator-5554 

*** Keywords ***
Start Appium
    Start Process  appium  -a  localhost  -p  4723   shell=True  alias=appiumserver  stdout=${EXECDIR}/Output/Appium Handler/appium_stdout.txt   stderr=${EXECDIR}/Output/Appium Handler/appium_stderr.txt
    Process Should Be Running     appiumserver
    #Sleep  10s

Stop Appium process
    Terminate Process    appiumserver    kill=True    

Restart Application
    Close Application
    Run Application    noReset=true
    Wait Until Page Contains Element            ${QUIZ_TITLE_ID}

Run Application
    [Arguments]     ${noReset}=true
    Open Application   http://localhost:4723/wd/hub    noReset=${noReset}     platformName=Android    platformVersion=11   deviceName=${DEVICE_ID}  appPackage=${MOCKO_PACKAGE}  appActivity=${MVI_ID}  automationName=Uiautomator2

Begin Android Test
    Set Appium Timeout    10
    Start Appium
    Run Application
    Wait Until Page Contains Element            ${MAIN_AVARAR_ID}

End Android Test
    Stop Appium process
    Close Application