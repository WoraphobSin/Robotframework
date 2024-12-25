*** Settings ***
Library         SeleniumLibrary


*** Variables ***



*** Keywords ***
Verify page loaded
    wait until page contains            foo