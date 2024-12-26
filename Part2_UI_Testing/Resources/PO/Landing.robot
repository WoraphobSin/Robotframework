*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${LANDING_HEADER_LABEL}                 xpath=//div[@class='login_logo']
#${LANDING_HEADER_LABEL}                 Swag Labs
${LANDONG_USERNAME_TEXTBOX}             xpath=//input[@id='user-name']
${LANDONG_PASSWORD_TEXTBOX}             xpath=//input[@id='password']
${LANDONG_LOGIN_BUTTON}                 xpath=//input[@id='login-button']

*** Keywords ***
Navigate to
    go to                               ${URL}

Verify page loaded
    wait until page contains element    ${LANDONG_LOGIN_BUTTON}

Fill username field
    [Arguments]                         ${USERNAME}
    input text                          ${LANDONG_USERNAME_TEXTBOX}     ${USERNAME}

Fill password field
    [Arguments]                         ${PASSWORD}
    input text                          ${LANDONG_PASSWORD_TEXTBOX}     ${PASSWORD}

Click "Login" button
    click button                        ${LANDONG_LOGIN_BUTTON}

Try to login
    [Arguments]                         ${USERNAME}     ${PASSWORD}
    Fill username field                 ${USERNAME}
    Fill password field                 ${PASSWORD}
    Click "Login" button

Expected error message
    [Arguments]                         ${ExpectedErrorMsg}
    wait until page contains            ${ExpectedErrorMsg}