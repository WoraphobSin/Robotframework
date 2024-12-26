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
    [Arguments]         ${URL}      ${STATUS}       ${PRODUCT_ID}
    ${Respone}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
    log   ${PRODUCT_ID}
    IF    ${Status} == 200
          ${Deleted_Product}  set variable        ${Respone.json()}
          log                 ${Deleted_Product}
          should be true      ${Deleted_Product}    # Ensure respone is not empty
    END

Delete product doesn't exit from FakeStore
    [Arguments]         ${URL}      ${STATUS}       ${PRODUCT_ID}
    ${Respone}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
    log   ${PRODUCT_ID}
    IF    ${Status} == 200
          ${Deleted_Product}  set variable        ${Respone.json()}
          log                 ${Deleted_Product}
          should not be true  ${Deleted_Product}    # Ensure respone is empty
    END
##############################################################################
#Delete product from FakeStore
#    [Arguments]         ${URL}      ${STATUS}
#    ${All_Product}      get all product from fakestore           ${URL}      ${STATUS}
#    ${Length} =         get length           ${All_Product}
#    log                 ${Length}
#    ${Condition_1}      Evaluate    ${PRODUCT_ID} > 0
#    ${Condition_2}      Evaluate    ${PRODUCT_ID} <= ${Length}
#    run keyword if      ${Condition_1} and ${Condition_2}    Delete product     ${STATUS}
#    ...    ELSE     log    Product ID doesn't exit : ${PRODUCT_ID}
#
#Delete product
#    [Arguments]    ${Status}
#    ${Respone}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
#    run keyword if    ${Status} == 200    Store respone          ${Respone}
#
#
#Store respone
#    [Arguments]    ${Respone}
#    ${Deleted_Product}  set variable        ${Respone.json()}
#    log               ${Deleted_Product}
################################################################################
Get product categories
    [Arguments]         ${URL}      ${STATUS}
    ${Respone}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${CATEGORY_PATH}      expected_status=${Status}
    IF  ${Status} == 200
        ${Categories}       set variable        ${Respone.json()}
        log                 ${Categories}
    END

Get sort products
    [Arguments]         ${URL}      ${STATUS}   ${SORT_TYPE}
    ${Respone}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${SORT_TYPE}      expected_status=${Status}
    IF  ${Status} == 200
        ${Sorted_Product}       set variable        ${Respone.json()}
        log                 ${Sorted_Product}
    END