*** Settings ***
Library             RPA.Assistant
Library             RPA.Browser.Playwright    jsextension=${CURDIR}/module.js
Library     Collections


*** Variables ***
&{state}    title=Click Reload    locationherf=""

*** Tasks ***
Main
    Starting a browser with a page
    Run Dialog Box
    
    
    
*** Keywords ***

Run Dialog Box
    Display Main Menu
    ${result}=    Run Dialog
    ...    title=PII anonymizateur example
    ...    on_top=True
    ...    height=450


Display Main Menu
    Clear Dialog
    Add Heading    ${state}[title]
    Add Next Ui Button    Reload     Reload Data
    Add Submit Buttons    buttons=Close    default=Close
    #Starting a browser with a page
    



Reload Data
    [Arguments]   ${dupa}={}
    ${browser_data}=    myGoToKeyword
    Set To Dictionary    dictionary=${state}    &{browser_data}
    Clear Dialog
    Add Heading    ${state}[title]
    Add Text    ${state}[locationherf]
    Add Text    text=${browser_data}
    Add Next Ui Button    Reload     Reload Data
    Add Submit Buttons    buttons=Close    default=Close
    Refresh Dialog
    #Sleep    1s


Starting a browser with a page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://marketsquare.github.io/robotframework-browser/Browser.html
    #Wait For Condition    contains   ==    https://marketsquare.github.io/robotframework-browser/Browser.html
    #Set To Dictionary    dictionary=${state}    one=${title}