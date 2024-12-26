*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${CHECKOUT_HEADER_LABEL}                Checkout: Your Information
${CHECKOUT_FIRST_NAME_TEXTBOX}          id=first-name
${CHECKOUT_LAST_NAME_TEXTBOX}           id=last-name
${CHECKOUT_POSTAL_CODE_TEXTBOX}         id=postal-code
${CHECKOUT_CONTINUE_BUTTON}             id=continue

*** Keywords ***
Verify page loaded
    wait until page contains            ${CHECKOUT_HEADER_LABEL}

Fill "First Name" field
    [Arguments]             ${First_Name}
    input text              ${CHECKOUT_FIRST_NAME_TEXTBOX}      ${First_Name}

Fill "Last Name" field
    [Arguments]             ${Last_Name}
    input text              ${CHECKOUT_LAST_NAME_TEXTBOX}       ${Last_Name}

Fill "Zip/Postal Code" field
    [Arguments]             ${Postal_Code}
    input text              ${CHECKOUT_POSTAL_CODE_TEXTBOX}     ${Postal_Code}

Fill Receiver information
    [Arguments]    ${First_Name}    ${Last_Name}    ${Zip/Postal Code}
    Fill "First Name" field         ${First_Name}
    Fill "Last Name" field          ${Last_Name}
    Fill "Zip/Postal Code" field    ${Zip/Postal Code}

Click "Continue" button
    click button            ${CHECKOUT_CONTINUE_BUTTON}

Expected error message
    [Arguments]                     ${ExpectedErrorMsg}
    wait until page contains        ${ExpectedErrorMsg}