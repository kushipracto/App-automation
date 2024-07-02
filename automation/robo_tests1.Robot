*** Settings ***
Library    AppiumLibrary
*** Test Cases ***
Open Test Application
    open application    http://localhost:4723/wd/hub    platformName=Android  platformVersion=13    appActivity=LauncherAlias  automationName=Appium    appPackage=com.practo.fabric
    wait until page contains element    com.practo.fabric:id/login_help     10
    click element   com.practo.fabric:id/login_help
    click element    //android.widget.Button[@resource-id="com.practo.fabric:id/card_button" and @text="Sign in with email"]
    input text   com.practo.fabric:id/email_edit_text   mobile.practo+consult1@gmail.com
    input text    com.practo.fabric:id/password_edit_text  practo@321
    click element    com.practo.fabric:id/continue_button
    wait until page contains element    com.android.permissioncontroller:id/grant_dialog    10s
    click element    com.android.permissioncontroller:id/permission_allow_button
     wait until page contains element    com.practo.fabric:id/dialog_title  10s
    click element    com.practo.fabric:id/close

    click element     com.practo.fabric:id/search_bar_image
    Wait Until Element Is Visible    //android.widget.TextView[@text="In-clinic Consultation"]  10
    click element   //android.widget.TextView[@text="In-clinic Consultation"]
    Wait Until Element Is Visible    com.practo.fabric:id/search_bar    10


    input text    com.practo.fabric:id/search_bar  Thyriod
    click element     com.practo.fabric:id/suggestion_type
    Wait Until Element Is Visible    com.practo.fabric:id/layout_item_listing_doctor_card_info  10
    click element    com.practo.fabric:id/layout_item_listing_doctor_card_info
    Wait Until Element Is Visible    com.practo.fabric:id/text_view_all_slots   10
    click element    com.practo.fabric:id/text_view_all_slots
    Wait Until Element Is Visible    com.practo.fabric:id/slot_info     10
    Click Element    com.practo.fabric:id/slot_info
