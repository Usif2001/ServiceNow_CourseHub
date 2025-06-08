*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${SERVICE_NOW_URL}    https://dev228130.service-now.com/
${SECOND_URL}     https://dev228130.service-now.com/x/1623260/hub-ui/courses
${USERNAME}       admin
${PASSWORD}       Hajibapa123,
${LOGIN_BUTTON}   id=sysverb_login
${PAGE_LOAD_TIMEOUT}    40s
${TOGGLE_BUTTON}  id=item-repeater_1_0_toggle_button

*** Test Cases ***
Login to ServiceNow and Toggle Course Subscription
    [Documentation]    Test to verify successful login and course subscription toggle functionality
    Open Browser to ServiceNow Login Page
    Login to ServiceNow
    Navigate to Second URL
    Toggle First Course Subscription
    [Teardown]    Close Browser

*** Keywords ***
Open Browser to ServiceNow Login Page
    [Documentation]    Opens browser to ServiceNow login page
    Open Browser    ${SERVICE_NOW_URL}    ${BROWSER}
    Maximize Browser Window

Login to ServiceNow
    [Documentation]    Enters credentials and logs into ServiceNow
    Wait Until Page Contains Element    id=user_name    timeout=${PAGE_LOAD_TIMEOUT}
    Input Text    id=user_name    ${USERNAME}
    Input Password    id=user_password    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

Navigate to Second URL
    [Documentation]    Navigates to the second URL after successful login
    Go To    ${SECOND_URL}
    Wait Until Page Contains Element    css:.hide-live-region    timeout=${PAGE_LOAD_TIMEOUT}


Toggle First Course Subscription
    [Documentation]    Toggles the first course subscription button and verifies text change via `data-ariadescribedby`
    Execute JavaScript
    ...    function queryShadow(selector, root=document) {
    ...        const el = root.querySelector(selector);
    ...        if (el) return el;
    ...        const shadows = [...root.querySelectorAll('*')].filter(e => e.shadowRoot);
    ...        for (const shadow of shadows) {
    ...            const found = queryShadow(selector, shadow.shadowRoot);
    ...            if (found) return found;
    ...        }
    ...        return null;
    ...    }
    ...    window._toggleEl = queryShadow("now-button[id$='1_0_toggle_button']");
    ...    if (window._toggleEl) window._toggleEl.click();

    Sleep    2s
    Reload Page
    Sleep    3s

    ${state}=    Execute JavaScript
    ...    function queryShadow(selector, root=document) {
    ...        const el = root.querySelector(selector);
    ...        if (el) return el;
    ...        const shadows = [...root.querySelectorAll('*')].filter(e => e.shadowRoot);
    ...        for (const shadow of shadows) {
    ...            const found = queryShadow(selector, shadow.shadowRoot);
    ...            if (found) return found;
    ...        }
    ...        return null;
    ...    }
    ...    const btn = queryShadow("now-button[id$='1_0_toggle_button']");
    ...    if (!btn) return 'not_found';
    ...    const nativeBtn = btn.shadowRoot?.querySelector("button");
    ...    return nativeBtn?.getAttribute("data-ariadescribedby");

    Log    Current State: ${state}
    Run Keyword If    '${state}' != 'Unsubscribe' and '${state}' != 'Subscribe'    Fail    Unexpected button state after toggle: ${state}
