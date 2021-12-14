*** Settings ***
Library    SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${acc_info}   //*[@id="dt_core_account-info_acc-info"]
${demo_acc}    //*[@id="dt_core_account-switcher_demo-tab"]
${market_type}   //*[@class="cq-symbol-select-btn"]
${rise_buy}     //*[@id="dt_purchase_call_button"]/div[4]/div/span
${clk_forex}    //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[3]/span
${contract_type}   //*[@id="dt_contract_dropdown"]/div
${trade_lower}     //*[@id="dt_contract_high_low_item"]/span
${duration_field}    //*[@id="dt_simple_duration_datepicker"]/div/div/input
${payout_field}    //*[@id="dt_amount_input"]
${barrier_valfield}    //*[@id="dt_barrier_1_input"]

# class="ic-icon cq-symbol-dropdown"        class="cq-symbol-select-btn"



*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pw}
    Switch Account
    Buy Rise Contract
    Buy Lower Contract
    Check Barrier Error
    Check Multiplier Parameter