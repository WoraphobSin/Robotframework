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