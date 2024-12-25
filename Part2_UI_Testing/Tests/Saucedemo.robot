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
    [Documentation]         Valid credentials should be able to login
    [Tags]                  1002
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded

Login should fail with invalid credentials
    [Documentation]         Invalid credentials should not be able to login
    [Tags]                  1003
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${INVALID_CREDENTIALS.Username}     ${VALID_PASSWORD}
    SaucedemoApp.Verify expected message    ${INVALID_CREDENTIALS.ExpectedErrorMsg}

Login should fail with blank username
    [Documentation]         Blank username should not be able to login
    [Tags]                  1003
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${BLANK_USERNAME.Username}          ${BLANK_USERNAME.Password}
    SaucedemoApp.Verify expected message    ${BLANK_USERNAME.ExpectedErrorMsg}

Login should fail with blank password
    [Documentation]         Blank password should not be able to login
    [Tags]                  1003
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${BLANK_PASSWORD.Username}          ${BLANK_PASSWORD.Password}
    SaucedemoApp.Verify expected message    ${BLANK_PASSWORD.ExpectedErrorMsg}

Products should be able to add to cart
    [Documentation]         Add products to cart
    [Tags]                  1004    Testing
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart

Verify products added to cart
    [Documentation]         Verify product added to cart
    [Tags]                  1005
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added

Should be able to go to checkout page
    [Documentation]         Verify checkout page load
    [Tags]                  1006
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login           ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page

Should be able to go to continue with filled information in checkout-step-one page
    [Documentation]         ...
    [Tags]                  1007
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_FRIST_NAME}  ${RECEIVER_LAST_NAME}   ${RECEIVER_POSTAL_CODE}
    SaucedemoApp.Go to checkout step two page

#Should not be able to continue with empty information in checkout-step-one page
#    [Documentation]         ...
#    [Tags]                  ...
#    SaucedemoApp.Go to landing page
#    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
#    SaucedemoApp.Verify inventory page loaded
#    SaucedemoApp.Add products to cart
#    SaucedemoApp.Go to cart
#    SaucedemoApp.Verify products added
#    SaucedemoApp.Go to checkout step one page
#    SaucedemoApp.Fill Receiver information      ${RECEIVER_FRIST_NAME}  ${RECEIVER_LAST_NAME}   ${RECEIVER_POSTAL_CODE}
#    SaucedemoApp.Go to checkout step two page

Checkout-step-two page should contains correct products and price
    [Documentation]         ...
    [Tags]                  1009
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_FRIST_NAME}  ${RECEIVER_LAST_NAME}   ${RECEIVER_POSTAL_CODE}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price

Checkout-complete page should loads
    [Documentation]         ...
    [Tags]                  1010
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_FRIST_NAME}  ${RECEIVER_LAST_NAME}   ${RECEIVER_POSTAL_CODE}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price
    SaucedemoApp.Go to checkout complete page

Home page should load after checkout complete
    [Documentation]         ...
    [Tags]                  1011
    SaucedemoApp.Go to landing page
    SaucedemoApp.Attempt to login               ${LIST_VALID_USERNAME}[0]           ${VALID_PASSWORD}
    SaucedemoApp.Verify inventory page loaded
    SaucedemoApp.Add products to cart
    SaucedemoApp.Go to cart
    SaucedemoApp.Verify products added
    SaucedemoApp.Go to checkout step one page
    SaucedemoApp.Fill Receiver information      ${RECEIVER_FRIST_NAME}  ${RECEIVER_LAST_NAME}   ${RECEIVER_POSTAL_CODE}
    SaucedemoApp.Go to checkout step two page
    SaucedemoApp.Recheck products added
    SaucedemoApp.Verify subtotal price
    SaucedemoApp.Go to checkout complete page
    SaucedemoApp.Back to home page