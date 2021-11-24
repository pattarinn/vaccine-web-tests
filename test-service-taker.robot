*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${SITE_URL}         https://vaccine-haven.herokuapp.com/
${BROWSER}          Chrome
${CITIZEN_ID}       9621054556405
${SITE_NAME}        OGYHSite
${VACCINE_NAME}     Pfizer

*** Test Cases ***
Visit homepage and verify citizen registration link and vaccine reservation link
    Open The Website
    Verify Citizen Registration Link
    Verify Vaccine Reservation Link

Visit homepage and make a reservation
    Open The Website
    Click Reservation Button
    Fill In Information For Reservation
    wait until location is      ${SITE_URL}

Verify reservation
    Open The Website
    Go To My Information Page
    Fill Citizen ID And Submit
    wait until location is      ${SITE_URL}info/${CITIZEN_ID}
    Verify Reservation          ${VACCINE_NAME}     ${SITE_NAME}

Cancel Reservation
    Open The Website
    Go To My Information Page
    Fill Citizen ID And Submit
    wait until location is      ${SITE_URL}info/${CITIZEN_ID}
    Cancel Vaccine Reservation

Verify that the reservation is cancelled
    Open The Website
    Go To My Information Page
    Fill Citizen ID And Submit
    wait until location is      ${SITE_URL}info/${CITIZEN_ID}
    Verify Reservation          ${EMPTY}      ${EMPTY}

*** Keywords ***
Open The Website
    Open Browser    ${SITE_URL}    ${BROWSER}

Verify Citizen Registration Link
    page should contain link    id:register__link

Verify Vaccine Reservation Link
    page should contain link    id:reserve__link

Click Reservation Button
    click link      id:reserve__link

Fill In Information For Reservation
    input text                      id:citizen_id       ${CITIZEN_ID}
    select from list by value       id:site_name        ${SITE_NAME}
    select from list by value       id:vaccine_name     ${VACCINE_NAME}
    wait until element contains     id:site_name        ${SITE_NAME}
    wait until element contains     id:vaccine_name     ${VACCINE_NAME}
    click button    id:reserve__btn

Go To My Information Page
    click link      id:nav__info__link

Fill Citizen ID And Submit
    input text      id:citizen_id     ${CITIZEN_ID}
    submit form

Cancel Vaccine Reservation
    click button      id:cancel__btn

Verify Reservation
    [Arguments]     ${vaccine}      ${vaccine_site}
    element should contain      id:reserve_vaccine_value    ${vaccine}
    element should contain      id:reserve_site_value       ${vaccine_site}
