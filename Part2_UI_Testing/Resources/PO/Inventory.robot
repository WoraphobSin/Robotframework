*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${INVENTORY_HEADER_LABEL}               xpath=//div[@id='header_container']/div[2]/span
${INVENTORY_PRODUCT_BUTTON}             xpath=//button[@id='add-to-cart-sauce-labs-backpack']

*** Keywords ***
Verify page loaded
    wait until page contains element           ${INVENTORY_HEADER_LABEL}

Click "Add to cart" button"
#    [Arguments]         ${Product_ID}
    click button        ${INVENTORY_PRODUCT_BUTTON}



