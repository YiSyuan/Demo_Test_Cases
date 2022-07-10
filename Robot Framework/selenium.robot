*** Settings ***
Documentation    Use Selenium to complete the automation testing
Library           BuiltIn
Library           Collections
Library           OperatingSystem
Library           String
Library           SeleniumLibrary    30    10
Library           DateTime

Suite Setup    Suite Setup
Suite Teardown    Close Browser

*** Variables ***
${searchName} =    Winnie

*** Test Cases ***
Search winnie on Google
    [Documentation]    Input "Winnie" on Google Search Input box and Verify page contains the word
    Click Element    ${searchXpath}
    Input Text    ${searchXpath}    ${searchName}
    Press Keys    ${searchXpath}    ENTER
    Wait Until Page Contains    ${searchName}    timeout=10s    error="${searchName}" doesn't reveal on page

*** Keywords ***
Suite Setup
    Open Browser    https://www.google.com.tw/?hl=zh_TW    browser=chrome    executable_path=chromedriver.exe
    Set Suite Variable    ${searchXpath}    //input[@title="Google 搜尋"]
