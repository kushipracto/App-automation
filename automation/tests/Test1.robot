*** Settings ***
Library    AppiumLibrary
*** Test Cases ***
Open Test Application
    open application    http://localhost:4723/wd/hub    platformName=Android  platformVersion=13    appActivity=LauncherAlias  automationName=Appium    appPackage=com.practo.fabric
Enter Destails to Login
    wait until page contains element    com.practo.fabric:id/login_help      10
    click element    com.practo.fabric:id/login_help
    click element    //android.widget.Button[@resource-id="com.practo.fabric:id/card_button" and @text="Sign in with email"]
    input text    com.practo.fabric:id/email_edit_text     mobile.practo+consult1@gmail.com
    input text    com.practo.fabric:id/password_edit_text  practo@321
    click element    com.practo.fabric:id/continue_button

*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}              http://localhost:4723/wd/hub
${PLATFORM_NAME}           Android
${PLATFORM_VERSION}        13
${DEVICE_NAME}             vivi v20 pro 13
${APP_PACKAGE}             com.practo.fabric
${APP_ACTIVITY}            com.practo.fabric.LauncherActivity
${EMAIL}                   mobile.practo+consult1@gmail.com
${PASSWORD}                practo@321

*** Test Cases ***
Login With Email
    [Documentation]    Automate login process on Practo app
    [Tags]    PractoLogin
    Open Application    ${REMOTE_URL}    ${PLATFORM_NAME}    ${DEVICE_NAME}    ${APP_PACKAGE}    ${APP_ACTIVITY}
    Enter Details to Login
    Capture Page Screenshot    # Capture screenshot on success
    Close Application

*** Keywords ***
Open Application
    [Arguments]    ${url}    ${platform}    ${device}    ${appPackage}    ${appActivity}
    Open Application    ${url}    platformName=${platform}    deviceName=${device}    appPackage=${appPackage}    appActivity=${appActivity}
Close Application
    Close Application

Enter Details to Login
    [Timeout]    30 seconds    # Adjust timeout as needed
    Wait Until Page Contains Element    com.practo.fabric:id/login_help    timeout=10s
    Click Element    com.practo.fabric:id/login_help
    Click Element    //android.widget.Button[@resource-id="com.practo.fabric:id/card_button" and @text="Sign in with email"]
    Input Text     com.practo.fabric:id/email_edit_text    ${EMAIL}
    Input Text    com.practo.fabric:id/password_edit_text    ${PASSWORD}
    Click Element    com.practo.fabric:id/continue_button