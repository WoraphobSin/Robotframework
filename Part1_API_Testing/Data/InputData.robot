*** Variables ***
${BROWSER}              edge
${URL}                  https://fakestoreapi.com
${INVALID_URL}          https://fakestoreapi.com/test
${PRODUCTS_PATH}        /products
${CATEGORY_PATH}        /categories

${CREATED_SESSION}      My session
${STATUS_SUCCESS}       200
${STATUS_NOT_FOUND}     404
${PRODUCT_ID}           19
@{INVALID_PRODUCT_ID}   -10     0    3.142857   99
&{NEW_PRODUCT}          title=Snow Fuji    price=53.99    description=Hello World    category=men's clothing    image=https://www.google.com
&{EDIT_PRODUCT}         title=Update       price=100.99   description=abc            category=jewelery          image=https://www.youtube.com

${SORT_ASC}             ?sort=asc
${SORT_DESC}            ?sort=desc
