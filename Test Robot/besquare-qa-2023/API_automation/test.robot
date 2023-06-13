*** Settings ***
Documentation    Automation Testing on Deriv API
Library    SeleniumLibrary

*** Variables ***
${user_acc}    //a[@class="trading-hub-header__setting"]
${settings_page}    //div[@class="dc-page-overlay__header-title"]
${option_api_token}    //div[@id="/account/api-token"]
${input_tname}    //input[@name="token_name"]
${create_btn}    //*[text()="Create"]/parent::button
${token_row}    //tr[@class="da-api-token__table-cell-row"]
${token_scope}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[3]
${delete}    //*[@data-testid="dt_token_delete_icon"]
${delete_prompt}    //*[@class="dc-text da-api-token__modal-title"]
${confirm_del}    //*[text()="Yes, delete"]/parent::button
${copy}    //*[@data-testid="dt_copy_token_icon"]
${visibility}    //*[@data-testid="dt_toggle_visibility_icon"]
${hidden}    //div[@class="da-api-token__pass-dot-container"]
${show}    //div[@class="da-api-token__clipboard-wrapper"]
${logout}    //div[@class="dc-vertical-tab__header-account__logout"]

# checkbox_scope
${checkbox_read}    //*[@class="da-api-token__checkbox-wrapper"]/div[1]
${checkbox_trade}    //*[@class="da-api-token__checkbox-wrapper"]/div[2]
${checkbox_pymt}    //*[@class="da-api-token__checkbox-wrapper"]/div[3]
${checkbox_info}    //*[@class="da-api-token__checkbox-wrapper"]/div[4]
${checkbox_adm}    //*[@class="da-api-token__checkbox-wrapper"]/div[5]


*** Keywords ***
Open Website
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024

Login Account
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    #email
    Input Password    txtPass    #password
    Click Element    login
    Wait Until Element Is Visible    ${user_acc}

Open API Page
    Click Element    ${user_acc}
    Wait Until Page Contains Element    ${settings_page}    10
    Click Element    ${option_api_token}
    Wait Until Page Contains Element    ${input_tname}    10

Show Element
    Wait Until Element Is Visible    ${token_row}    10
    Click Element    ${visibility}
    Wait Until Element Is Visible    ${show}    10

Create Test Token
    Click Element    ${checkbox_read}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Enabled    ${token_row}    10
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Read

Clear Token
    Wait Until Element Is Visible    ${token_row}    10
    Click Element    ${delete}
    Wait Until Element Is Visible    ${delete_prompt}    10
    Click Element    ${confirm_del}
    Wait Until Element Is Visible    ${settings_page}    10

*** Test Cases ***
login
    Open Website
    Login Account

open API
    Open Website
    Login Account
    Open API Page

create token with no scope access selected and less than 2 character token name
    Open Website
    Login Account
    Open API Page
    Input Text    ${input_tname}    c
    Element Should Be Disabled    ${create_btn}
    Close Browser

create token with read scope access
    Open Website
    Login Account
    Open API Page
    Click Element    ${checkbox_read}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Enabled    ${token_row}    10
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Read
    Clear Token
    Close Browser
    
create token with trade scope access
    Open Website
    Login Account
    Open API Page
    Click Element    ${checkbox_trade}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Visible    ${token_row}    10
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Trade
    Clear Token
    Close Browser

create token with payment scope access
    Open Website
    Login Account
    Open API Page
    Click Element    ${checkbox_pymt}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Visible    ${token_row}    10
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Payments
    Clear Token
    Close Browser

create token with trading information scope access
    Open Website
    Login Account
    Open API Page
    Click Element    ${checkbox_info}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Enabled    ${token_row}    10
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Trading information
    Clear Token
    Close Browser

create token with admin scope access
    Open Website
    Login Account
    Open API Page
    Click Element    ${checkbox_adm}
    Input Text    ${input_tname}    testtoken1
    Wait Until Element Is Enabled    ${create_btn}    10
    Click Element    ${create_btn}
    Wait Until Element Is Enabled    ${token_row}    10
    Scroll Element Into View    ${logout}
    Element Should Contain    ${token_row}    testtoken1
    Element Text Should Be    ${token_scope}    Admin
    Clear Token
    Close Browser

delete token
    Open Website
    Login Account
    Open API Page
    Wait Until Element Is Visible    ${token_row}    10
    Click Element    ${delete}
    Wait Until Element Is Visible    ${delete_prompt}    10
    Click Element    ${confirm_del}
    Wait Until Element Is Visible    ${settings_page}    10
    Close Browser

copy token
    Open Website
    Login Account
    Open API Page
    Create Test Token
    Wait Until Element Is Visible    ${token_row}    10
    Click Element    ${copy}
    Clear Token
    Close Browser

show token
    Open Website
    Login Account
    Open API Page
    Create Test Token
    Wait Until Element Is Visible    ${token_row}    10
    Click Element    ${visibility}
    Wait Until Element Is Visible    ${show}    10
    Clear Token
    Close Browser

hide token visibility
    Open Website
    Login Account
    Open API Page
    Create Test Token
    Show Element
    Click Element    ${visibility}
    Wait Until Element Is Visible    ${hidden}    10
    Clear Token
    Close Browser

