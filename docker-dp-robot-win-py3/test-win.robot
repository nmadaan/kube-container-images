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
    
Open Google Chrome Option
    Open Chrome Browser
    GoTo    http://google.com
    Capture Page Screenshot
    ${title}=       Get Title
    Should Be Equal    Google    ${title}
    Capture Page Screenshot
    Close Browser
    
*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    #${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    #Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
