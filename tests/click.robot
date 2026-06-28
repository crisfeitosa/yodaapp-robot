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

  Sleep   5

  Close Application