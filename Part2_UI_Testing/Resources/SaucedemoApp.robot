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

Verify inventory page loaded
    Inventory.Verify page loaded

Verify expected message
    [Arguments]    ${ExpectedErrorMsg}
    Landing.Expected error message  ${ExpectedErrorMsg}

Add products to cart
    Inventory.Click "Add to cart" button"

Go to cart
    TopNav.Click "Cart icon
    Cart.Verify page loaded

Verify products added
    Cart.Verify products added

Go to checkout step one page
    Cart.Click "Checkout" button
    Checkout-step-one.Verify page loaded

Fill Receiver information
    [Arguments]    ${First_Name}    ${Last_Name}    ${Zip/Postal Code}
    Checkout-step-one.Fill Receiver information     ${First_Name}    ${Last_Name}    ${Zip/Postal Code}

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