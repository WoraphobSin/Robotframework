*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${TOPNAV_CART_LINK_ICON}                    xpath=//div[@id='shopping_cart_container']/a
${TOPNAV_BURGER_BUTTON}                     id=react-burger-menu-btn
${TOPNAV_ALL_ITEMS_LINK}                    id=inventory_sidebar_link
${TOPNAV_ABOUT_LINK}                        id=about_sidebar_link
${TOPNAV_LOGOUT_LINK}                       id=logout_sidebar_link
${TOPNAV_RESET_APP_STATE}                   id=reset_sidebar_link

*** Keywords ***
Click "Cart" icon
    click link              ${TOPNAV_CART_LINK_ICON}

Click "Burger" button
    click button            ${TOPNAV_BURGER_BUTTON}

Click "ALL Items" link
    Click "Burger" button
    click link              ${TOPNAV_ALL_ITEMS_LINK}

Click "About" link
    Click "Burger" button
    click link              ${TOPNAV_ABOUT_LINK}

Click "Logout" link
    Click "Burger" button
    click link              ${TOPNAV_LOGOUT_LINK}

Click "Reset App State" link
    Click "Burger" button
    click link              ${TOPNAV_RESET_APP_STATE}