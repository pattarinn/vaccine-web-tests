*** Settings ***
Library         SeleniumLibrary
#Resource        user-information.resource
*** Variables ***
${CITIZEN_ID}   9621054556405
${FIRSTNAME}    namedemo
${LASTNAME}     lastnamedemo
${BIRTHDATE}    01/01/2000
${OCCUPATION}   Student
${PHONENUMBER}  0999999999
${ADDRESS}      Mars
${SITE_URL}     https://vaccine-haven.herokuapp.com/registration
${BROWSER}      Chrome

*** Keywords ***
Open The Website
    Open Browser    ${SITE_URL}    ${BROWSER}

Fill In The Information
    input text      name:citizen_id     ${CITIZEN_ID}
    input text      name:name           ${FIRSTNAME}
    input text      name:surname        ${LASTNAME}
    input text      name:birth_date     ${BIRTHDATE}
    input text      name:occupation     ${OCCUPATION}
    input text      name:phone_number   ${PHONENUMBER}
    input text      name:address        ${ADDRESS}

*** Tasks ***
Register citizen
    Open The Website
    Fill In The Information
    submit form



