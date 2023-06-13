*** Settings ***
Documentation    Purchase rise contract with demo account
Library    SeleniumLibrary
Library    Process

*** Variables ***
${thub_btn}    //*[@class="dc-text trading-hub-header__tradershub--text"]
${real_acc}    //*[@id="dropdown-display"]//span[@value="real"]
${demo_acc}    //div[@id="demo"]
${balance_real}    //*[@class="dc-text balance-text__text--real"]
${balance_demo}    //*[@class="dc-text balance-text__text--demo"]
${open_dtrader}    //*[@class="dc-btn dc-btn--primary"]
${menu_btn}    //*[@class="cq-menu-btn"]
${markets}    //*[contains(text(),"Markets")]
${m_derived}    //*[contains(text(),"Derived")]
${derived_synthetics}    //*[contains(text(),"Synthetics")]
${CI_opt1}    //*[contains(text(),"Volatility 10 (1s) Index")]
${range_5ticks}    //*[@class="range-slider"]//input[@value="5"]
${purchase_btn}    //*[@id="dt_purchase_call_button"]



*** Test Cases ***
buy rise contract
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    #email
    Input Password    txtPass    #password
    Click Element    login
    Wait Until Page Contains Element    ${thub_btn}    10
    Click Element    ${thub_btn}
    Wait Until Page Contains Element    ${real_acc}    10
    Wait Until Page Contains Element    ${balance_real}    10
    Click Element    ${real_acc}
    Wait Until Element Is Visible    ${demo_acc}    5
    Click Element    ${demo_acc}
    Wait Until Page Contains Element    ${balance_demo}
    Click Element    ${open_dtrader}
    Wait Until Element Is Visible    ${menu_btn}    10
    Click Element    ${menu_btn}
    Wait Until Element Is Visible    ${markets}    10
    Click Element    ${derived_synthetics}
    Wait Until Element Is Visible    ${CI_opt1}    10
    Click Element    ${CI_opt1}
    Wait Until Element Is Visible    ${purchase_btn}    10
    Click Element    ${purchase_btn}
    