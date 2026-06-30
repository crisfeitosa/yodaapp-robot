*** Settings ***

Resource         ../resources/base.resource

*** Test Cases ***
Deve poder remover o Darth Vader

  Start session
  Get started

  Navigate to    Star Wars
  Go to item     Lista    Darth Vader

  ${positions}    Get element location    xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]

  ${start_x}    Set Variable    ${positions}[x]
  ${start_y}    Set Variable    ${positions}[y]
  ${end_x}      Evaluate    ${positions}[x] - 650
  ${end_y}      Set Variable    ${positions}[y]

  Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${end_y}    duration=1000ms

  Click Element    id=com.qaxperience.yodapp:id/btnRemove

  Wait Until Page Does Not Contain    Darth Vader  

  Close session

