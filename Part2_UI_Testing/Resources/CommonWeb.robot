*** Settings ***
Library         SeleniumLibrary


*** Variables ***



*** Keywords ***
Begin web test
#    set selenium speed                  0.2s
    set selenium timeout                5s
    open browser                        about:blank     ${BROWSER}

End web test
    close all browsers