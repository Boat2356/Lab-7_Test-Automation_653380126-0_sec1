*** Settings ***
Resource    resource.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page

Record Success
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Credentials
    Verify Record Success
    [Teardown]    Close Browser