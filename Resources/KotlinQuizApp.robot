*** Settings ***
Library    AppiumLibrary

*** Variables ***
&{KOTLINQUIZZ}      appPackage=com.kotlinquiz.app   openAppActivity=com.kotlinquiz.app.ui.splash.SplashActivity

#Main Page
${FIRSTAVATAR_ID}       id=com.kotlinquiz.app:id/avatar_card

#Inside an avatar
${AVATAR_BACK_BUTTON}   //android.view.ViewGroup//android.widget.ImageButton
${AVATAR_OK_BUTTON}     //android.view.ViewGroup//android.widget.Button
${QUIZZ_HEADER}         //android.widget.TextView[@text="Cuestionario de Principios SOLID"]
${QUIZZ_FIRST_QUESTION}      //android.widget.FrameLayout[@index=0]//android.widget.RadioButton


*** Keywords ***
Open KotlinQuizz Application
    [Arguments]    ${noReset}=false
    Open Application    http://localhost:4723/wd/hub    noReset=${noReset}      deviceName=emulator-5554    platformName=Android    appPackage=${KOTLINQUIZZ}[appPackage]   appActivity=${KOTLINQUIZZ}[openAppActivity]

Open An Avatar
    Wait Until Page Contains Element    ${FIRSTAVATAR_ID}
    Click Element    ${FIRSTAVATAR_ID}
    Wait Until Page Contains Element    ${AVATAR_BACK_BUTTON}
    Click Element   ${AVATAR_OK_BUTTON}

Restore Application
    Open KotlinQuizz Application    true
    Wait Until Page Contains Element    ${QUIZZ_HEADER}

Check The Quizz Responses
    Wait Until Page Contains Element    ${QUIZZ_FIRST_QUESTION}
    FOR  ${Index}  IN RANGE  3
      Click Element    //android.widget.FrameLayout[@index=${Index}]//android.widget.RadioButton
    END