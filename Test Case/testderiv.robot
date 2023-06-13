*** Settings ***
Documentation    single test for check and trade button
Library    SeleniumLibrary

*** Variables ***
${check_btn}    //*[@id="gatsby-focus-wrapper"]/main/section[1]/div[3]/a
${tradenow_btn}    //*[@id="gatsby-focus-wrapper"]/main/section[1]/div[3]/button
${cfd_btn}    //*[contains(text(),"CFDs")]
${markets_btn}    //*[contains(text(),"Markets")]


*** Test Cases ***
check
    Open Browser    https://deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    ${check_btn}    10
    Wait Until Page Contains Element    ${tradenow_btn}    10
    Click Element    ${markets_btn}
    
    