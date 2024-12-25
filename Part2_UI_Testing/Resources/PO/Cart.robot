*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${CART_HEADER_LABEL}                    Your Cart
${CART_PRODUCT_NAME_1}                  Sauce Labs Backpack
${CART_PRODUCT_NAME_2}                  Sauce Labs Fleece Jacket
${CART_CHECKOUT_BUTTON}                 id=checkout

*** Keywords ***
Verify page loaded
    wait until page contains            ${CART_HEADER_LABEL}

Verify products added
    page should contain                 ${CART_PRODUCT_NAME_1}
    page should contain                 ${CART_PRODUCT_NAME_2}

Click "Checkout" button
    click button                        ${CART_CHECKOUT_BUTTON}