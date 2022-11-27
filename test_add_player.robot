*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*/button[contains(@ class, 'MuiButton')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYERBUTTON}      xpath=//*[text () = 'Add player']/ancestor::button
${NAMEINPUT}        xpath=//input[@name="name"]
${SURNAMEINPUT}     xpath=//input[@name="surname"]
${MAINPOSSITOININPUT}       xpath=//input[@name="mainPosition"]
${AGEINPUT}     xpath=//input[@name="age"]
${SUBMITBUTTON}     xpath=//*[contains(@ class, "MuiCardActions-root")]/child::button[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Signin button
    Click on the Add Player button
    Type in name
    Type in surname
    Type in main possition
    Type in age
    Click on the Submit button
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
    Wait Until Element Is Visible       ${PAGELOGO}
Click on the Add Player button
    Click Element       ${ADDPLAYERBUTTON}
Type in name
    Input Text      ${NAMEINPUT}    User
Type in surname
    Input Text    ${SURNAMEINPUT}   User
Type in main possition
    Input Text    ${MAINPOSSITOININPUT}     Player
Type in age
    Input Text    ${AGEINPUT}    01/01/2000
Click on the Submit button
    Click Element    ${SUBMITBUTTON}





