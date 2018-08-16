Feature: Endicia WebReg: Header Footer Validation

  Background:
    Given Start test driver

  @ewwr_header_footer_validation
  Scenario: Header Footer Validation

    Then WL: navigate to https://registration.endicia.com/registration/
    Then WL: navigates to default registration page for endicia with the following offer id 707

    #Verifying all content present to profile page
    Then pause for 5 seconds
    Then WL: expect registration navigation bar endicia logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists
    Then WL: expect profile bread crumbs is Profile

    #Verify Privacy Policy modal to profile page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Endicia Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal to profile page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Endicia Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    #Profile Page
    Then WL: set profile page default values
    Then WL: click profile page continue button

    #Validate navigate to Membership page
    #Verifying all content present to Membership page
    Then pause for 2 seconds
    Then WL: expect membership page bread crumbs is Membership
    Then WL: expect registration navigation bar endicia logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    #Verify Privacy Policy modal to Membership page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Endicia Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal to Membership page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Endicia Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    #Membership Page
    Then WL: set membership page default values
    Then WL: set membership page address to PO Box 2951 US-41
    Then WL: set membership page city to Inverness
    Then WL: select membership page state FL
    Then WL: set membership page zip to 34450

    Then WL: click membership page submit button
    Then WL: check if address standardized is present then click continue

    Then pause for 1 seconds
    Then WL: expect membership page bread crumbs is Membership
    Then WL: expect registration navigation bar endicia logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    Then pause for 2 seconds
    Then WL: set postage meter address to 1990 E Grand Ave
    Then WL: set postage meter city to El Segundo
    Then WL: select postage meter state CA
    Then WL: set postage meter zip to 90245

    #Verify Privacy Policy modal to Membership page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Endicia Privacy Policy
    Then pause for 1 second
    Then WL: click modal x button

    #Verify Copyrights modal to Membership page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Endicia Website Terms of Use and Copyright Notice
    Then WL: click modal x button

    Then WL: click membership page submit button

    #Security Question
    Then WL: expect security questions header to be Before you start printing postage, make sure your account is protected.

    Then pause for 1 seconds
    Then WL: expect registration navigation bar endicia logo exists
    Then WL: expect registration navigation bar usps logo exists
    Then WL: expect registration navigation bar header text exists
    Then WL: expect registration container norton logo exists

    #Verify Privacy Policy modal to Membership page
    Then WL: expect registration container privacy policy link exists
    Then WL: click registration container privacy policy link
    Then WL: expect privacy policy modal header is Privacy Policy
    Then WL: expect privacy policy modal body header is Endicia Privacy Policy
    Then WL: click modal x button

    #Verify Copyrights modal to Membership page
    Then WL: expect registration container copyright exists
    Then WL: click registration container copyright link
    Then WL: expect copyright modal header is Endicia Website Terms of Use and Copyright Notice
    Then WL: click modal x button