*** Settings ***
Resource            ./PO/Cart.robot
Resource            ./PO/Checkout-complete.robot
Resource            ./PO/Checkout-step-one.robot
Resource            ./PO/Checkout-step-two.robot
Resource            ./PO/Inventory.robot
Resource            ./PO/Landing.robot
Resource            ./PO/TopNav.robot

*** Variables ***


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
    Cart.Validate products added