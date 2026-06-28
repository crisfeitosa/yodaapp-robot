*** Settings ***

Library          AppiumLibrary

*** Variables ***
${START}     QAX

*** Test Cases ***
Deve realizar um click simples

  Start session
  Get started
  Navigate to     Clique em Botões
  Go to item      Clique simples    Botão clique simples
  
  Click Text                      CLIQUE SIMPLES
  Wait Until Page Contains        Isso é um clique simples

  Close session

*** Keywords ***
Start session
  Open Application   http://localhost:4723
  ...                platformName=Android
  ...                deviceName=Android Emulator
  ...                automationName=UIAutomator2
  ...                app=${EXECDIR}/app/yodapp-beta.apk
  ...                uid=emulator-5554
  ...                autoGrantPermissions=true

Get started
  Wait Until Page Contains   ${START}    5
  Click Text                 ${START}

Navigate to
  [Arguments]    ${item_text}
  ${hamburger}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

  Wait Until Element Is Visible   ${hamburger}    5
  Click Element                   ${hamburger}

  ${menu_item}  Set Variable      xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]

  Wait Until Element Is Visible   ${menu_item}    5
  Click Element                   ${menu_item}

Go to item
  [Arguments]    ${item}    ${checkpoit}
  Wait Until Page Contains        ${item}    5
  Click Text                      ${item}
  Wait Until Page Contains        ${checkpoit}

Close session
  Close Application