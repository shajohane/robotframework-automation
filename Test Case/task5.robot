*** Settings ***
Documentation    Check multiplier contract parameter
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
${contract_dropdown}    //*[@id="dt_contract_dropdown"]
${CT_multiplier}    //*[@id="dt_contract_multiplier_item"]
${multiplier_disp}    //*[@value="multiplier"]
${CI_opt6}    //*[contains(text(),"Volatility 50 Index")]
${stake}    //*[@id="trade_container"]/div[4]/div/fieldset[2]/fieldset/div[1]/span[1]
${prompt_barrier}    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div[2]/div/span
${dt_dropdown_container}    //div[@data-testid="dt_dropdown_container"]
# checkbox options
${check_takeprofit}    //label[@class="dc-checkbox take_profit-checkbox__input"]
${check_stoploss}    //label[@class="dc-checkbox stop_loss-checkbox__input"]
${check_dealcancel}    //label[@class="dc-checkbox"]
${dc_dropdown}    //*

${amount}    //*[@name="amount"]
${up_dcfee}    //*[@id="dt_purchase_multup_price"]/div/div[2]/span
${down_dcfee}    //*[@id="dt_purchase_multdown_price"]/div/div[2]/span

*** Keywords ***
Check Checkbox Option
    Element Should Be Enabled    ${check_takeprofit}
    Element Should Be Enabled    ${check_stoploss}
    Element Should Be Enabled    ${check_dealcancel}

Check Dropdown List
    Element Should Be Visible    xpath=//div[@id="20"]
    Element Should Be Visible    xpath=//div[@id="40"]
    Element Should Be Visible    xpath=//div[@id="60"]
    Element Should Be Visible    xpath=//div[@id="100"]
    Element Should Be Visible    xpath=//div[@id="200"]

Check Deal Cancelation Duration Dropdown
    Element Should Be Visible    xpath=//div[@id="5m"]
    Element Should Be Visible    xpath=//div[@id="10m"]
    Element Should Be Visible    xpath=//div[@id="15m"]
    Element Should Be Visible    xpath=//div[@id="30m"]
    Element Should Be Visible    xpath=//div[@id="60m"]

*** Test Cases ***
check multiplier contract parameter
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ikmal@besquare.com.my
    Input Password    txtPass    Ael5661!
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
    Wait Until Element Is Visible    ${CI_opt6}    10
    Click Element    ${CI_opt6}
    Wait Until Element Is Visible    ${contract_dropdown}    10
    Click Element    ${contract_dropdown}
    Wait Until Element Is Visible    ${CT_multiplier}    10
    Click Element    ${CT_multiplier}
    Wait Until Element Is Visible    ${multiplier_disp}    10 
    Wait Until Element Is Enabled    ${stake}    10
    Check Checkbox Option
    Click Element    ${dt_dropdown_container}
    Wait Until Element Is Visible    xpath=//div[@id="20"]    10
    Check Dropdown List
    Click Element    ${check_dealcancel}