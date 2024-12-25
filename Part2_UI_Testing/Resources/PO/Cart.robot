*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${CART_HEADER_LABEL}                    Your Cart


*** Keywords ***
Verify page loaded
    wait until page contains            ${CART_HEADER_LABEL}

Validate products added
