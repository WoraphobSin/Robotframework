*** Settings ***
Documentation           ...
Resource                ../Resources/FakeStoreAPI.robot

*** Variables ***
${BROWSER}              edge
${URL}                  https://fakestoreapi.com/

# run command
# robot -d results Tests/API_Testing.robot

*** Test Cases ***
My first try
    GET            ${URL}products       expected_status=200