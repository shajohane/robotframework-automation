*** Settings ***
Documentation    Check relative barrier error
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
${m_forex}    //*[contains(text(),"Forex")]
${derived_synthetics}    //*[contains(text(),"Synthetics")]
${CI_opt1}    //*[contains(text(),"Volatility 10 (1s) Index")]
${FX_opt2}    //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[2]/div[2]/div/div[5]/div[1]/div[3]
${contract_dropdown}    //*[@id="dt_contract_dropdown"]
${high_low}    //*[@id="dt_contract_high_low_item"]
${duration}    //*[@name="duration"]
${barrier_input}     //*[@id="dt_barrier_1_input"]
${toggle_payout}    //*[@id="dc_payout_toggle_item"]
${amount}     //*[@name="amount"]
${purchase_btn}    //*[@id="dt_purchase_put_button"]
${prompt_barrier}    //*[@id="trade_container"]/div[4]/div/fieldset[3]/div[2]/div/span



*** Test Cases ***
check relative barrier error
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
    Click Element    ${m_forex}
    Wait Until Element Is Visible    ${FX_opt2}    10
    Click Element    ${FX_opt2}
    Wait Until Element Is Visible    ${contract_dropdown}    10
    Click Element    ${contract_dropdown}
    Wait Until Element Is Visible    ${high_low}    10
    Click Element    ${high_low}
    Wait Until Element Is Visible    ${duration}    10
    Press Keys    ${duration}    CTRL+A+BACKSPACE
    Input Text    ${duration}    2
    Press Keys    ${barrier_input}    CTRL+A+BACKSPACE
    Input Text    ${barrier_input}    -0.1
    Wait Until Element Is Visible    ${prompt_barrier}    10
    Page Should Contain Element    xpath=//*[@id="trade_container"]/div[4]/div/fieldset[3]/div[2]/div/span
    Press Keys    ${amount}    CTRL+A+BACKSPACE
    Input Text    ${amount}    10
    Wait Until Element Is Visible    ${toggle_payout}    5
    Click Element    ${toggle_payout}
    Element Should Be Disabled    ${purchase_btn}