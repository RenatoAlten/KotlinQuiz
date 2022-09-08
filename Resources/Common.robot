*** Comments ***
*** Settings ***
Library    AppiumLibrary
Library    Process

*** Variables ***
#*** Home Variables ***
${AGNET-ICON}        id=com.airbus.agnet.mission:id/bootstrapAppLogo

#*** Application Variables ***
${APK_PATH}          ${CURDIR}\\app-debug.apk
${APP-ID}            com.kotlinquiz.app
${APP-ACTIVITY}      com.airbus.agnet.work.main.MainActivity
${APP_PACKAGE}       com.airbus.agnet.mission
${DEVICE_ID}         emulator-5554 

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
    Wait Until Page Contains Element            ${AGNET-ICON}

Run Application
    [Arguments]     ${noReset}=true
    Open Application   http://localhost:4723/wd/hub    noReset=${noReset}     platformName=Android    platformVersion=11   deviceName=${DEVICE_ID}  appPackage=${APP_PACKAGE}  appActivity=${APP-ACTIVITY}  automationName=Uiautomator2

Begin Android Test
    Set Appium Timeout    10
    Start Appium
    Run Application
    Wait Until Page Contains Element            ${AGNET-ICON}
    Sleep  2s

End Android Test
    Stop Appium process
    Close Application

Open Settings Context
    Click Element   ${AGNET-ICON}
    Wait Until Page Contains Element            ${APPLY-BUTTON}

Change Server Values
    Clear Text      ${CONF-FIELD}
    Input Text      ${CONF-FIELD}       conf-1.qa-1.eu-west-1.agnet.com
    Clear Text      ${HOSTNAME-FIELD}
    Input Text      ${HOSTNAME-FIELD}   agnet.com
    Sleep  1s
    Click Element   ${APPLY-BUTTON}

Change Organization ID
    Wait Until Page Contains Element            ${AGNET-ICON}
    Input Text      ${ORGANIZATION-ID-FIELD}        530739

Register Organization
    Click Element   ${TERMS-CHECKBOX}
    Click Element   ${REGISTER-BUTTON}  
    Sleep  20s


