*** Settings ***
Documentation     Reusable test cases
Library           SeleniumLibrary

*** Variables ***
${username}       standard_user
${password}       secret_sauce

*** Keywords ***
Start the test case
    Open Browser    https://www.saucedemo.com/    Firefox    Maximize Browser Window
    Input Text      xpath=//input[@id='user-name']    ${username}
    Input Text      xpath=//input[@id='password']     ${password}
    Click Element   xpath=//input[@id='login-button']
    Sleep           5

Finish the test case
    Capture Page Screenshot    filename=C:\\Users\\Wasim Ansari\\IdeaProjects\\RobotFW_DEmo\\TestSuites\\MyScreenshots\\abc.png
    Close Browser
