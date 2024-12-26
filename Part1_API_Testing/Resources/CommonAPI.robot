*** Settings ***
Library         RequestsLibrary

*** Variables ***


*** Keywords ***
Begin API test
    Create Session          ${CREATED_SESSION}      ${URL}

End API test
    Delete All Sessions