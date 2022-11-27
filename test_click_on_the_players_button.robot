*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*/button[contains(@ class, 'MuiButton')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PLAYERSBUTTON}        xpath=//*[@ class = 'MuiList-root MuiList-padding'][1]/child::div[2]
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Click on the Players Button
    Open login page
    Type in email
    Type in password
    Click on the Signin button
    Click on the Players button
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Signin button
    Click Element       xpath=//*/button[contains(@ class, 'MuiButton')]
Click on the Players button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${PLAYERSBUTTON}
