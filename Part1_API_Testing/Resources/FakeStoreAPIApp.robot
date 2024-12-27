*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
*** Variables ***


*** Keywords ***
Get all product from FakeStore
    [Arguments]         ${URL}      ${Status}
    ${Response}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}      expected_status=${Status}
    IF  ${Status} == 200
        ${All_Product}      set variable        ${Response.json()}
        log                 ${All_Product}
    END

Get single product from FakeStore
    [Arguments]             ${URL}      ${Status}       ${PRODUCT_ID}
    ${Response}             GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}      expected_status=${Status}
    IF  ${Status} == 200
        ${Product}    set variable    ${Response.json()}
        log      ${Product}
    END

Get single product that doesn't exit from FakeStore
    [Arguments]             ${URL}      ${Status}       ${INVALID_PRODUCT_ID}
    ${Response}             GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}/${INVALID_PRODUCT_ID}      expected_status=${Status}
    IF  ${Status} == 200
        should not be true    ${Response.content}
    END

Add new product to FakeStore
    [Arguments]         ${URL}      ${Status}
    ${Response}          POST On Session     ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}     ${NEW_PRODUCT}    expected_status=${Status}
    IF    ${Status} == 200
          ${Created_Product}  set variable        ${Response.json()}
          log                 ${Created_Product}
    END

Edit product information
    [Arguments]         ${URL}      ${Status}
    ${Response}          PUT On Session    ${CREATED_SESSION}        ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    ${EDIT_PRODUCT}     expected_status=${Status}
    IF    ${Status} == 200
          ${Edited_Product}  set variable        ${Response.json()}
          log                 ${Edited_Product}
    END

Delete product from FakeStore
    [Arguments]         ${URL}      ${STATUS}       ${PRODUCT_ID}
    ${Response}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
    log   ${PRODUCT_ID}
    IF    ${Status} == 200
          ${Deleted_Product}  set variable        ${Response.json()}
          log                 ${Deleted_Product}
          should be true      ${Deleted_Product}    # Ensure Response is not empty
    END

Delete product doesn't exit from FakeStore
    [Arguments]         ${URL}      ${STATUS}       ${PRODUCT_ID}
    ${Response}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
    log   ${PRODUCT_ID}
    IF    ${Status} == 200
          ${Deleted_Product}  set variable        ${Response.json()}
          log                 ${Deleted_Product}
          should not be true  ${Deleted_Product}    # Ensure Response is empty
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
#    ${Response}     DELETE On Session      ${CREATED_SESSION}     ${URL}${PRODUCTS_PATH}/${PRODUCT_ID}    expected_status=${Status}
#    run keyword if    ${Status} == 200    Store Response          ${Response}
#
#
#Store Response
#    [Arguments]    ${Response}
#    ${Deleted_Product}  set variable        ${Response.json()}
#    log               ${Deleted_Product}
################################################################################
Get product categories
    [Arguments]         ${URL}      ${STATUS}
    ${Response}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${CATEGORY_PATH}      expected_status=${Status}
    IF  ${Status} == 200
        ${Categories}       set variable        ${Response.json()}
        log                 ${Categories}
    END

Get sort products
    [Arguments]         ${URL}      ${STATUS}   ${SORT_TYPE}
    ${Response}          GET On Session      ${CREATED_SESSION}      ${URL}${PRODUCTS_PATH}${SORT_TYPE}      expected_status=${Status}
    IF  ${Status} == 200
        ${Sorted_Product}       set variable        ${Response.json()}
        log                 ${Sorted_Product}
    END