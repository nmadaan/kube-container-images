*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Open Google Chrome
    Open Browser     http://google.com    Chrome
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    [Teardown]