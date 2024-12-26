*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${CART_HEADER_LABEL}                    Your Cart
${CART_PRODUCT_NAME_1}                  Sauce Labs Backpack
${CART_PRODUCT_NAME_2}                  Sauce Labs Fleece Jacket
${CART_REMOVE_PRODUCT_1}                id=remove-sauce-labs-backpack
${CART_REMOVE_PRODUCT_2}                id=remove-sauce-labs-fleece-jacket
${CART_CHECKOUT_BUTTON}                 id=checkout
${CART_CONTINUE_SHOPPING_BUTTON}        id=continue-shopping

*** Keywords ***
Verify page loaded
    wait until page contains            ${CART_HEADER_LABEL}

Verify products added
    page should contain                 ${CART_PRODUCT_NAME_1}
    page should contain                 ${CART_PRODUCT_NAME_2}

Verify products removed
    page should not contain             ${CART_PRODUCT_NAME_1}
    page should not contain             ${CART_PRODUCT_NAME_2}

Click "Remove" button
    click button                        ${CART_REMOVE_PRODUCT_1}
    click button                        ${CART_REMOVE_PRODUCT_2}

Click "Checkout" button
    click button                        ${CART_CHECKOUT_BUTTON}

Click "Continue Shopping" button
    click button                        ${CART_CONTINUE_SHOPPING_BUTTON}