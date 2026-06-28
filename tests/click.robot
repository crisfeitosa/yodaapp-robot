*** Settings ***

Library          AppiumLibrary

*** Variables ***
${START}     QAX

*** Test Cases ***
Deve realizar um click simples

  Open Application   http://localhost:4723
  ...                platformName=Android
  ...                deviceName=Android Emulator
  ...                automationName=UIAutomator2
  ...                app=${EXECDIR}/app/yodapp-beta.apk
  ...                uid=emulator-5554
  ...                autoGrantPermissions=true

  Wait Until Page Contains   ${START}    5
  Click Text    ${START}

  ${hamburger}  Set Variable   xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

  Wait Until Element Is Visible   ${hamburger}    5
  Click Element   ${hamburger}

  ${menu_item}  Set Variable   xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Clique em Botões"]

  Wait Until Element Is Visible   ${menu_item}    5
  Click Element   ${menu_item}

  Sleep   5

  Close Application