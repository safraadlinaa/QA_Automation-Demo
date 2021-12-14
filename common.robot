*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Keywords ***
Login
    [arguments]  ${email}   ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    set window size    1500   1028
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    ${login_btn}     60
    Click element   ${login_btn}
    wait until page contains element    ${email_field}    30
    input text  ${email_field}  ${email}
    input text  ${pw_field}   ${pw}
    click element    ${login_oauth_btn}

Switch Account
    sleep    5
    wait until page contains element    ${acc_info}     60
    click element   ${acc_info}
    wait until page contains element    ${demo_acc}     60
    click element   ${demo_acc}
    click element   //*[@id="dt_VRTC4795382"]/span

Buy Rise Contract
# to reload page
    reload page
    wait until page does not contain element    chart-container__loader
    sleep   5
#to click on market type
    wait until page contains element    ${market_type}    60
    sleep   3
    click element   ${market_type}
# to click on votality 10
    sleep   5
    click element   //*[@class="ic-icon ic-1HZ10V"]
# to click on rise to buy
    sleep    5
    wait until page contains element    ${rise_buy}   60
    click element   ${rise_buy}

Buy Lower Contract
# to click forex + aud
    sleep   3
    click element   ${market_type}
    wait until page contains element    ${clk_forex}  60
    sleep   3
    click element   ${clk_forex}
    sleep  5
    click element   //*[@class="ic-frx ic-frxAUDUSD"]
# to change trade type to higher/lower
    sleep   5
    wait until page contains element    ${contract_type}  60
    click element   ${contract_type}
    sleep   5
    wait until page contains element     ${trade_lower}   60
    click element      ${trade_lower}
    clear input field    ${duration_field}
    input text   ${duration_field}   2
    sleep  2
    click element   //*[@id="dc_payout_toggle_item"]
    clear input field    ${payout_field}
    input text      ${payout_field}   15.50
    sleep   2
    click element    //*[@id="dt_purchase_put_button"]


Check Barrier Error
    sleep   2
    click element       ${barrier_valfield}
    clear input field   ${barrier_valfield}
    input text      ${barrier_valfield}   +1
    sleep   5
    click element   ${payout_field}
    Clear Input Field    ${payout_field}
    input text   ${payout_field}      10
    sleep   2

Check Multiplier Parameter
# to change to vol_50 and trade type multiplier
    sleep   2
    click element    ${market_type}
    click element    //*[@class="ic-icon ic-synthetic_index"]
    click element    //*[@class="ic-icon ic-R_50"]
# to change to synthetic indices & vol50
    sleep   2
    click element    ${contract_type}
    sleep   2
    page should not contain     //*[@id="chart_container"]/div[1]/div/div/div/button
    click element    //*[@id="dt_contract_multiplier_item"]/span



#clear input text field
Clear Input Field
    [Arguments]    ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE
