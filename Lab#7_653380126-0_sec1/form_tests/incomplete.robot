*** Settings ***
Resource    resource.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page

Empty Destination
    Input First Name    Somsong
    Input Last Name    Sandee       
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Credentials
    Verify Empty Destination
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page

Empty Email
    Input First Name    Somsong
    Input Last Name    Sandee    
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother    
    Input Phone    081-111-1234
    Submit Credentials
    Verify Empty Email
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page

Invalid Email
    Input First Name    Somsong
    Input Last Name    Sandee    
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@    
    Input Phone    081-111-1234
    Submit Credentials
    Verify Invalid Email
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page

Empty Phone Number
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com    
    Submit Credentials
    Verify Empty Phone Number
    [Teardown]    Close Browser

Open Form
    Open Browser To Form Page

Invalid Phone Number
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    191
    Submit Credentials
    Verify Invalid Phone Number
    [Teardown]    Close Browser

