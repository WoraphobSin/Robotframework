*** Settings ***
Documentation       This is my UI testing assignment whole suite
Resource            ../Resources/CommonWeb.robot
Resource            ../Resources/SaucedemoApp.robot
Resource            ../Data/Inputdata.robot
Test Setup          CommonWeb.Begin web test
Test Teardown       CommonWeb.End web test

#   Run command
#   robot -d results Tests/Saucedemo.robot

*** Test Cases ***
Landing page should loaded
    [Documentation]         Verify landing page loaded
    [Tags]                  1001
#    set log level           trace
    SaucedemoApp.Go to landing page

Login should succeed with valid credentials
    [Documentation]         Verify valid credentials can login
    [Tags]                  1002
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded

Invalid login scenarios should display correct error messages
    [Documentation]         Verify invalid credentials can not login with correct error message
    [Tags]                  1003
    [Template]              Test multiple login scenarios
    ${INVALID_CREDENTIALS}
    ${BLANK_USERNAME}
    ${BLANK_PASSWORD}

Products should be able to add to cart
    [Documentation]         Verify that can add products to cart
    [Tags]                  1004
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart

Products should add to cart
    [Documentation]         Verify products added to cart successfully
    [Tags]                  1005
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added

Checkout page should load after click "Checkout" button
    [Documentation]         Verify "Checkout" button work correctly
    [Tags]                  1006
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page

Should be able to continue with filled information in checkout-step-one page
    [Documentation]         Verify that filled information can contiue
    [Tags]                  1007
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_INFORMATION.First_Name}    ${RECEIVER_INFORMATION.Last_Name}   ${RECEIVER_INFORMATION.Postal_Code}
    SaucedemoApp.Go to checkout step two page

Should not be able to continue with empty information in checkout-step-one page
    [Documentation]         Verify that empty information field can not continue
    [Tags]                  1008
    [Template]              Test multiple checkout information scenarios
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}       ${RECEIVER_BLANK_FIRST_NAME}
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}       ${RECEIVER_BLANK_LAST_NAME}
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}       ${RECEIVER_BLANK_POSTAL_CODE}

Checkout-step-two page should contains correct products and price
    [Documentation]         Verify that products and price display correctly
    [Tags]                  1009
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_INFORMATION.First_Name}    ${RECEIVER_INFORMATION.Last_Name}   ${RECEIVER_INFORMATION.Postal_Code}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price

Checkout-complete page should load after click "Finish" button
    [Documentation]         Verify "Finish" button work correctly
    [Tags]                  1010
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_INFORMATION.First_Name}    ${RECEIVER_INFORMATION.Last_Name}   ${RECEIVER_INFORMATION.Postal_Code}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price
    SaucedemoApp.Go to checkout complete page

Home page should load after click "Back Home" button
    [Documentation]         Verify "Back Home" button work correctly
    [Tags]                  1011
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_INFORMATION.First_Name}    ${RECEIVER_INFORMATION.Last_Name}   ${RECEIVER_INFORMATION.Postal_Code}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price
    SaucedemoApp.Go to checkout complete page
    SaucedemoApp.Back to home page

Should be able to log out
    [Documentation]         Verify User can logout successfully
    [Tags]                  1012
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Attempt to logout

Continue shopping button should be back to inventory page
    [Documentation]         Verify "Continue shopping" button is work correctly
    [Tags]                  1013
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Back to inventory page

Products should be able to remove from cart
    [Documentation]         Verify that products have been removed from cart
    [Tags]                  1014
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Remove products from cart

Filter should be apply to products list
    [Documentation]         Verify filter select is applied
    [Tags]                  1015
    [Template]              Select filter in inventory page
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}    ${SELECT_FILTER_INDEX}[0]
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}    ${SELECT_FILTER_INDEX}[1]
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}    ${SELECT_FILTER_INDEX}[2]
    ${LIST_VALID_USERNAME}      ${VALID_PASSWORD}    ${SELECT_FILTER_INDEX}[3]


