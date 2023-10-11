*** Settings ***
Resource          Common.robot
Library           String
Suite Setup       Common.Start the test case
Suite Teardown    Common.Finish the test case

*** Test Cases ***
Add Sauce Lab Back Pack and perform end-to-end navigation
    Set Selenium Timeout    2
    Add Sauce Lab Back Pack to the cart
    Go to Cart
    Click on Checkout Button
    Enter details and click on Continue button
    Click on Finish Button
    Verify the Thank you for your order! message

*** Keywords ***
Add Sauce Lab Back Pack to the cart
    Click Element    xpath=//button[@id='add-to-cart-sauce-labs-backpack']


Go to Cart
    Click Element    xpath=//a[@class='shopping_cart_link']

Click on Checkout Button
    Click Element       xpath=//button[@id='checkout']

Enter details and click on Continue button
    Sleep	5
    ${random_string}=    Generate Random String    10    [LETTERS]
    Input Text  xpath=//input[@id='first-name']    ${random_string}
    Sleep	5
    Input Text  xpath=//input[@id='last-name']     ${random_string}
    Input Text  xpath=//input[@id='postal-code']	1234
    Wait Until Element Is Enabled   css=.cart_cancel_link
    Element Should Be Enabled       css=.cart_cancel_link
    Sleep	5
    Click Element  xpath=//input[@id='continue']
    Sleep	5


Click on finish Button
    Click Element  xpath=//button[@id='finish']


verify the Thank you for your order! message
    Sleep       5
    Page Should Contain         Thank you for your order!


