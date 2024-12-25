*** Settings ***
Library         SeleniumLibrary
Library         String
Library         Collections
*** Variables ***
${INVENTORY_HEADER_LABEL}               xpath=//div[@id='header_container']/div[2]/span
${INVENTORY_PRODUCTS_LIST}              xpath=//div[@class='inventory_list']/*
${INVENTORY_PRODUCT_4_BUTTON}           xpath=//button[@id='add-to-cart-sauce-labs-backpack']
${INVENTORY_PRODUCT_5_BUTTON}           xpath=//button[@id='add-to-cart-sauce-labs-fleece-jacket']
&{PRODUCT_LIST}

*** Keywords ***
Verify page loaded
    wait until page contains element           ${INVENTORY_HEADER_LABEL}

Get product list
    ${Products}         Get WebElements         ${INVENTORY_PRODUCTS_LIST}
    ${Length} =         get length              ${Products}
    FOR     ${INDEX}    IN RANGE    1   ${Length} + 1
            ${Attribute}        set variable            xpath=//div[@class='inventory_list']/div[${INDEX}]
#            Log                 ${Attribute}
#            click button        ${Attribute}//button
            ${Product_Name}     get element attribute   ${Attribute}/div[2]/div[1]/a/div    innerHTML
#            Log                 ${Product_Name}
            ${Product_Price}    get element attribute   ${Attribute}/div[2]/div[2]/div[1]   innerHTML
            ${Product_Price}    Remove String           ${Product_Price}    $
#            log                 ${Product_Price}
            append to list      &{PRODUCT_LIST}         Product_Name:${Product_Name},    Product_Price:${Product_Price}
    END
#    log                 &{PRODUCT_LIST}

Click "Add to cart" button"
#    [Arguments]         ${Product_ID}
    click button        ${INVENTORY_PRODUCT_4_BUTTON}
    click button        ${INVENTORY_PRODUCT_5_BUTTON}
