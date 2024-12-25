*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${TOPNAV_CART_LINK_ICON}                  xpath=//a[@class='shopping_cart_link']


*** Keywords ***
Click "Cart icon
    click link          ${TOPNAV_CART_LINK_ICON}