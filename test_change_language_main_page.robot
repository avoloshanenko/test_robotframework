*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*/button[contains(@ class, 'MuiButton')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${LANGUAGEBUTTON}       xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[1]
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
*** Test Cases ***
Change Language
    Open login page
    Type in email
    Type in password
    Click on the Signin button
    Click on the Language button

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
Click on the Language button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${LANGUAGEBUTTON}
