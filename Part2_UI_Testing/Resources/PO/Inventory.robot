*** Settings ***
Library         SeleniumLibrary
Library         String
Library         Collections

*** Variables ***
#${INVENTORY_HEADER_LABEL}                      xpath=//div[@id='header_container']/div[2]/span
#${INVENTORY_HEADER_LABEL}                      xpath=//span[@class='title']
${INVENTORY_HEADER_LABEL}                       Products
${INVENTORY_PRODUCTS_LIST}                      xpath=//div[@class='inventory_list']/*
${INVENTORY_ADD_PRODUCT_4_TO_CART_BUTTON}       id=add-to-cart-sauce-labs-backpack
${INVENTORY_ADD_PRODUCT_5_TO_CART_BUTTON}       id=add-to-cart-sauce-labs-fleece-jacket
${INVENTORY_REMOVE_PRODUCT_4_BUTTON}            id=remove-sauce-labs-backpack
${INVENTORY_REMOVE_PRODUCT_5_BUTTON}            id=remove-sauce-labs-fleece-jacket

${INVENTORY_SORT_CONTAINER_SELECT}              xpath=//*[@id="header_container"]/div[2]/div/span/select
${INVENTORY_SORT_AZ_SELECT}                     xpath=//*[@id="header_container"]/div[2]/div/span/select/option[1]
${INVENTORY_SORT_ZA_SELECT}                     xpath=//*[@id="header_container"]/div[2]/div/span/select/option[2]
${INVENTORY_SORT_LOW_TO_HIGH_SELECT}            xpath=//*[@id="header_container"]/div[2]/div/span/select/option[3]
${INVENTORY_SORT_HIGH_TO_LOW_SELECT}            xpath=//*[@id="header_container"]/div[2]/div/span/select/option[4]

&{PRODUCT_LIST}

*** Keywords ***
Verify page loaded
#    wait until page contains element          ${INVENTORY_HEADER_LABEL}
    wait until page contains                  ${INVENTORY_HEADER_LABEL}

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

Click "Add to cart" button
#    [Arguments]         ${Product_ID}
    click button        ${INVENTORY_ADD_PRODUCT_4_TO_CART_BUTTON}
    click button        ${INVENTORY_ADD_PRODUCT_5_TO_CART_BUTTON}

Select A-Z filter
    select from list by index       ${INVENTORY_SORT_CONTAINER_SELECT}      1

Select Z-A filter
    select from list by index       ${INVENTORY_SORT_CONTAINER_SELECT}      2

Select LOW-HIGH filter
    select from list by index       ${INVENTORY_SORT_CONTAINER_SELECT}      3

Select HIGH-LOW filter
    select from list by index       ${INVENTORY_SORT_CONTAINER_SELECT}      4