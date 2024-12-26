*** Settings ***
Library         RequestsLibrary

*** Variables ***


*** Keywords ***
Get all product from FakeStore
    [Arguments]         ${URL}      ${Status}
    ${Respone}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}      expected_status=${Status}
    IF  ${Status} == 200
        ${All_Product}      set variable        ${Respone.json()}
        log                 ${All_Product}
    END

Add new product to FakeStore
    [Arguments]         ${URL}      ${Status}
    ${Respone}          POST On Session     ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}     ${NEW_PRODUCT}    expected_status=${Status}
    IF    ${Status} == 200
          ${Created_Product}  set variable        ${Respone.json()}
          log                 ${Created_Product}
    END

Edit product information
    [Arguments]         ${URL}      ${Status}
    ${Respone}          PUT On Session    ${CREATED_SESSION}        ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    ${EDIT_PRODUCT}     expected_status=${Status}
    IF    ${Status} == 200
          ${Edited_Product}  set variable        ${Respone.json()}
          log                 ${Edited_Product}
    END

Delete product from FakeStore
    [Arguments]         ${URL}      ${STATUS}
    get all product from fakestore           ${URL}      ${STATUS}

    ${Respone}          DELETE On Session    ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
    IF    ${Status} == 200
          ${Deleted_Product}  set variable        ${Respone.json()}
          ${Deleted_Product}
          log                 ${Deleted_Product}
    END

Get product categories
    [Arguments]         ${URL}      ${STATUS}
    ${Respone}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${CATEGORY_PATH}      expected_status=${Status}
    IF  ${Status} == 200
        ${Categories}       set variable        ${Respone.json()}
        log                 ${Categories}
    END

#Get sorted product
#    [Arguments]         ${URL}      ${STATUS}
#    ${Respone}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${CATEGORY_PATH}      expected_status=${Status}
#    IF  ${Status} == 200
#        ${Categories}       set variable        ${Respone.json()}
#        log                 ${Categories}
#    END