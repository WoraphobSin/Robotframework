*** Settings ***
Documentation           This is my first assignment whole suit
Resource                ../Resources/FakeStoreAPIApp.robot
Resource                ../Resources/CommonAPI.robot
Resource                ../Data/InputData.robot

Test Setup              CommonAPI.Begin API test
Test Teardown           CommonAPI.End API test

# run command
# robot -d results Tests/FakeStoreAPI.robot

*** Test Cases ***
Should be able to get all product
    [Documentation]         Verify that all products can be retrieved successfully
    [Tags]                  1001    GET
    FakeStoreAPIApp.Get all product from FakeStore         ${URL}              ${STATUS_SUCCESS}

Should not be able to get all product
    [Documentation]         Verify that all products can not be retrieved
    [Tags]                  1002    GET
    FakeStoreAPIApp.Get all product from FakeStore        ${INVALID_URL}      ${STATUS_NOT_FOUND}

Should be able to add new product
    [Documentation]         Verify that product has added successfully
    [Tags]                  1003    POST
    FakeStoreAPIApp.Add new product to FakeStore        ${URL}              ${STATUS_SUCCESS}

Should not be able to add new product
    [Documentation]         Verify that product has not added
    [Tags]                  1004    POST
    FakeStoreAPIApp.Add new product to FakeStore        ${INVALID_URL}      ${STATUS_NOT_FOUND}

Should be able to edit product information
    [Documentation]         Verify that product can edit
    [Tags]                  1005    PUT
    FakeStoreAPIApp.Edit product information            ${URL}              ${STATUS_SUCCESS}

Should not be able to edit product information
    [Documentation]         Verify that product can not edit
    [Tags]                  1006    PUT
    FakeStoreAPIApp.Edit product information            ${INVALID_URL}      ${STATUS_NOT_FOUND}

Should be able to delete product
    [Documentation]         Verify that product has been deleted
    [Tags]                  1007    DELETE
    FakeStoreAPIApp.Delete product from FakeStore       ${URL}              ${STATUS_SUCCESS}       ${PRODUCT_ID}

Should not be able to delete product that does not exit
    [Documentation]         Verify that product does not exit can not delete
    [Tags]                  1008    DELETE
    FakeStoreAPIApp.Delete product doesn't exit from FakeStore       ${URL}              ${STATUS_SUCCESS}       ${INVALID_PRODUCT_ID}[1]

Should not be able to delete product
    [Documentation]         Verify that product can not delete
    [Tags]                  1009    DELETE
    FakeStoreAPIApp.Delete product from FakeStore       ${INVALID_URL}      ${STATUS_NOT_FOUND}     ${PRODUCT_ID}

Should be able to get product categories
    [Documentation]         Verify that product categories have retrieved successfully
    [Tags]                  1010    GET
    FakeStoreAPIApp.Get product categories              ${URL}              ${STATUS_SUCCESS}

Should not be able to get product categories
    [Documentation]         Verify that product categories have not retrieved
    [Tags]                  1011    GET
    FakeStoreAPIApp.Get product categories              ${INVALID_URL}      ${STATUS_NOT_FOUND}

Test multiple scenarios of sorting
    [Documentation]         ...
    [Tags]                  1012    GET    SORT
    [Template]              FakeStoreAPIApp.Get sort products
    ${URL}              ${STATUS_SUCCESS}       ${SORT_ASC}
    ${INVALID_URL}      ${STATUS_NOT_FOUND}     ${SORT_ASC}
    ${URL}              ${STATUS_SUCCESS}       ${SORT_DESC}
    ${INVALID_URL}      ${STATUS_NOT_FOUND}     ${SORT_DESC}