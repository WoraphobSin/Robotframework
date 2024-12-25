*** Settings ***
Library         SeleniumLibrary
Library         String

*** Variables ***
${CHECKOUT_TWO_HEADER_LABEL}            Checkout: Overview
${CHECKOUT_TWO_PRODUCT_NAME_1}          Sauce Labs Backpack
${CHECKOUT_TWO_PRODUCT_NAME_2}          Sauce Labs Fleece Jacket
${CHECKOUT_TWO_PRODUCT_PRICE_1}         //*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]/div
${CHECKOUT_TWO_PRODUCT_PRICE_2}         //*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[2]/div[2]/div
${CHECKOUT_SUBTOTAL_PRICE}              //*[@id="checkout_summary_container"]/div/div[2]/div[6]
${CHECKOUT_FINISH_BUTTON}               id=finish
*** Keywords ***
Verify page loaded
    wait until page contains            ${CHECKOUT_TWO_HEADER_LABEL}

Verify products
    page should contain                 ${CHECKOUT_TWO_PRODUCT_NAME_1}
    page should contain                 ${CHECKOUT_TWO_PRODUCT_NAME_2}

Verify subtotal price
    ${Product_Price_1}                  get text    ${CHECKOUT_TWO_PRODUCT_PRICE_1}
    ${Product_Price_2}                  get text    ${CHECKOUT_TWO_PRODUCT_PRICE_2}
    ${Product_Subtotal_Price}           get text    ${CHECKOUT_SUBTOTAL_PRICE}

    ${Product_Price_1}                  remove string    ${Product_Price_1}             $
    ${Product_Price_2}                  remove string    ${Product_Price_2}             $
    ${Product_Subtotal_Price}           remove string    ${Product_Subtotal_Price}      Item total: $

    ${Product_Price_1}                  convert to number   ${Product_Price_1}      2
    ${Product_Price_2}                  convert to number   ${Product_Price_2}      2
    ${Product_Subtotal_Price}           convert to number   ${Product_Subtotal_Price}      2

    ${Product_Sum} =                    evaluate            ${Product_Price_1} + ${Product_Price_2}
    should be equal as numbers          ${Product_Sum}      ${Product_Subtotal_Price}    precision=2

Click "Finish" button
    click button                        ${CHECKOUT_FINISH_BUTTON}