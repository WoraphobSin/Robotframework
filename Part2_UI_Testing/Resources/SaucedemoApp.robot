*** Settings ***
Resource            ./PO/Cart.robot
Resource            ./PO/Checkout-complete.robot
Resource            ./PO/Checkout-step-one.robot
Resource            ./PO/Checkout-step-two.robot
Resource            ./PO/Inventory.robot
Resource            ./PO/Landing.robot
Resource            ./PO/TopNav.robot

*** Keywords ***
Go to landing page
    Landing.Navigate to
    Landing.Verify page loaded

Attempt to login
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Landing.Try to login            ${USERNAME}     ${PASSWORD}

Attempt to logout
    TopNav.Click "Logout" link
    Landing.Verify page loaded

Test multiple login scenarios
    [Arguments]    ${Crentials}
    Go to landing page
    Attempt to login                            ${Crentials.Username}     ${Crentials.Password}
    Verify expected message in login page       ${Crentials.ExpectedErrorMsg}

Verify inventory page loaded
    Inventory.Verify page loaded

Verify expected message in login page
    [Arguments]    ${ExpectedErrorMsg}
    Landing.Expected error message  ${ExpectedErrorMsg}

Back to inventory page
    Cart.Click "Continue Shopping" button
    Inventory.Verify page loaded

Add products to cart
    Inventory.Click "Add to cart" button

Select Z-A filter
    Inventory.Select Z-A filter

Go to cart
    TopNav.Click "Cart" icon
    Cart.Verify page loaded

Remove products from cart
    Cart.Click "Remove" button
    Cart.Verify products removed

Verify products added
    Cart.Verify products added

Go to checkout step one page
    Cart.Click "Checkout" button
    Checkout-step-one.Verify page loaded

Fill Receiver information
    [Arguments]    ${First_Name}    ${Last_Name}    ${Zip/Postal Code}
    Checkout-step-one.Fill Receiver information     ${First_Name}    ${Last_Name}    ${Zip/Postal Code}

Verify expected message in checkout information page
    [Arguments]    ${ExpectedErrorMsg}
    Checkout-step-one.Expected error message        ${ExpectedErrorMsg}

Test multiple checkout information scenarios
    [Arguments]    ${Username}      ${Password}     ${Receiver_Information}
    Go to landing page
    Attempt to login                ${Username}[0]  ${Password}
    Verify inventory page loaded
    Add products to cart
    Go to cart
    Verify products added
    Go to checkout step one page
    Fill Receiver information       ${Receiver_Information.First_Name}    ${Receiver_Information.Last_Name}   ${Receiver_Information.Postal_Code}
    Checkout-step-one.Click "Continue" button
    Verify expected message in checkout information page    ${Receiver_Information.ExpectedErrorMsg}
    TopNav.Click "Reset App State" link

Go to checkout step two page
    Checkout-step-one.Click "Continue" button
    Checkout-step-two.Verify page loaded

Recheck products added
    Checkout-step-two.Verify products

Verify subtotal price
    Checkout-step-two.Verify subtotal price

Go to checkout complete page
    Checkout-step-two.Click "Finish" button
    Checkout-complete.Verify page loaded

Back to home page
    Checkout-complete.Click "Back Home" button
