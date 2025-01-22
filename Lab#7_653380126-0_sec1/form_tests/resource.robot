*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${DELAY}          0
${FORM URL}      http://${SERVER}/Form.html
${COMPLETE URL}    http://${SERVER}/Complete.html

*** Keywords ***
Start Chrome For Testing
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${FORM URL}

Open Browser To Form Page
    Start Chrome For Testing
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Go To Form Page
    Go To    ${FORM URL}
    Form Page Should Be Open

Input First Name 
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input Last Name 
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}

Input Contact person 
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${Email}
    Input Text    email    ${Email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Credentials
    Click Button    submitButton

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Completed

Verify Record Success
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.

Verify Empty Destination
    Page Should Contain    Please enter your destination.

Verify Empty Email
    Page Should Contain    Please enter a valid email address.

Verify Invalid Email
    Page Should Contain    Please enter a valid email address.

Verify Empty Phone Number
    Page Should Contain    Please enter a phone number.

Verify Invalid Phone Number
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678