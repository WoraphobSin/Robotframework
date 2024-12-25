*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${CHECKOUT_COMPLETE_HEADER_LABEL}           Thank you for your order!
${CHECKOUT_COMPLETE_BACK_HOME_BUTTON}       id=back-to-products


*** Keywords ***
Verify page loaded
    wait until page contains                ${CHECKOUT_COMPLETE_HEADER_LABEL}

Click "Back Home" button
    click button                            ${CHECKOUT_COMPLETE_BACK_HOME_BUTTON}