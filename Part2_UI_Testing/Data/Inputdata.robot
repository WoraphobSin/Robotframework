*** Variables ***
# Configuration
${BROWSER}                  edge
${URL}                      https://www.saucedemo.com/

# Input data
@{LIST_VALID_USERNAME}      standard_user   locked_out_user  problem_user   performance_glitch_user   error_user  visual_user
${VALID_PASSWORD}           secret_sauce
&{INVALID_CREDENTIALS}      Username=hello_test     Password=Qwerty123      ExpectedErrorMsg=Epic sadface: Username and password do not match any user in this service
&{BLANK_USERNAME}           Username=               Password=Testing        ExpectedErrorMsg=Epic sadface: Username is required
&{BLANK_PASSWORD}           Username=HappyNewYear   Password=               ExpectedErrorMsg=Epic sadface: Password is required

# Product information
${PRODUCT_NAME_1}           xpath=//div[@class='inventory_list']/div[4]/div[2]/div[1]/a/div
${PRODUCT_NAME_2}           xpath=//div[@class='inventory_list']/div[5]/div[2]/div[1]/a/div
${PRODUCT_PRICE_1}          xpath=//div[@class='inventory_list']/div[4]/div[2]/div[2]/div[1]
${PRODUCT_PRICE_2}          xpath=//div[@class='inventory_list']/div[5]/div[2]/div[2]/div[1]

# Receiver information
${RECEIVER_FRIST_NAME}      Tony
${RECEIVER_LAST_NAME}       Stark
${RECEIVER_POSTAL_CODE}     A-22