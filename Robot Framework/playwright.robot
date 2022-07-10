*** Settings ***
Documentation    Use Playwright to complete the automation testing
Library           BuiltIn
Library           Browser    timeout=30s

Suite Setup    Suite Setup
Suite Teardown    Close Browser

*** Variables ***
${searchName} =    Winnie

*** Test Cases ***
Search winnie on Google
    [Documentation]    Input "Winnie" on Google Search Input box and Verify page contains the word
    Click    ${searchXpath}
    Fill Text    ${searchXpath}    ${searchName}
    Press Keys    ${searchXpath}    Enter
    Wait Until Network Is Idle
    Take Screenshot
    Wait For Elements State    text="「Winnie」的圖片搜尋結果"    state=visible    timeout=10s    message="${searchName}" doesn't reveal on page

*** Keywords ***
Suite Setup
    New Browser    chromium
    New Context    acceptDownloads=${TRUE}    viewport={'width': 1920, 'height': 1080}    ignoreHTTPSErrors=${TRUE}
    New Page    https://www.google.com.tw/
    Set Suite Variable    ${searchXpath}    //input[@title="Google 搜尋"]
