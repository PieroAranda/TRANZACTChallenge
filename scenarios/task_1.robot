*** Settings ***
Resource    ../load_resource.resource
Test Teardown    Close Browser


*** Test Cases ***

Task 1
    [Tags]    task_1
    Open Browser    ${EVERSHOP_URL}    chrome
    Click Element    xpath://a[@href='/account/login']
    Click Element    xpath://a[@href='/account/register']
    Generate Random Data for Customer
    Fill Create New Account Form
    Wait Until Element Is Visible    xpath://h2[text()='Discount 20% For All Orders Over $2000']
    Capture Page Screenshot
    Select a Product from Each Category
    Click Element    xpath:(//a[@href='/cart'])[2]
    Wait Until Element Is Visible    xpath://h4[text()='Order summary']
    Capture Page Screenshot
    Click Element    xpath://a[@href='/checkout']
    Wait Until Element Is Visible    xpath://h4[text()='Shipping Address']
    Capture Page Screenshot
    Fill Shipping Form
    Wait Until Element Is Visible    xpath://h4[text()='Payment Method']
    Capture Page Screenshot
    Fill Payment Method
    Wait Until Element Is Visible    xpath://div[contains(text(),'Thank you')]
    Capture Page Screenshot
    Verify Order was registered correctly


Task 2
    [Tags]    task_2
    # https://api.countrylayer.com/v2/all
    # https://api.countrylayer.com/v2/alpha/{code}
    # https://countrylayer.com/documentation

    