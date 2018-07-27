Feature: Stamps WebReg: Security Quetions Workflow

  Background:
    Given Start test driver

  @sdcwr_security_quetions_ui_validation
  Scenario: Security Quetions Page Validation

   # Profile Page
    Then WL: navigates to default registration page for stamps with the following source id 100-TES-WB001
    Then pause for 2 seconds
    Then WL: set profile page email to random value
    Then WL: set profile page username to random value
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: set profile page how did you hear about us? to Television Commercial

    Then WL: click profile page CONTINUE button

    #Membership Page
    Then pause for 2 seconds
    Then WL: set membership page personal info to random info between zone 1 and zone 9
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page credit card number to default value
    Then WL: select membership page credit card month Dec (12)
    Then WL: set membership page credit card year to this year plus 1
    Then WL: check membership page terms & conditions

    Then WL: click membership page submit button

    #Address Standardized
    Then WL: check if address standardized is present then click continue

    #Postage Meter Address
    Then WL: check if postage meter address is present then set the value

    #Choose Supplies Page
    Then WL: check choose supplies page is present then verify the page and click place order button

    #Security Question UI Validation
    Then WL: expect security questions get started button exists
    Then WL: click security questions get started button

    Then WL: expect first security question tooltip index 1 to be This field is required
    Then WL: expect first security answer tooltip index 1 to be This field is required
    Then WL: expect second security question tooltip index 1 to be This field is required
    Then WL: expect second security answer tooltip index 1 to be This field is required

    Then WL: select security questions first security question What is your mother's maiden name?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your pet's name?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your city of birth?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What was your high school mascot?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What street did you grow up on?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is the name of your first school?
    Then WL: expect security questions first security question is correct
    Then WL: select security questions first security question What is the make and model of your first car?
    Then WL: expect security questions first security question is correct

    # Validate second Security Quetion list
    Then WL: select security questions second security question What is your mother's maiden name?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your pet's name?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your city of birth?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is your father's birthplace?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What street did you grow up on?
    Then WL: expect security questions second security question is correct
    Then WL: select security questions second security question What is the name of your first school?
    Then WL: expect security questions second security question is correct

    Then WL: if security question is present before registration then set the values

    #Validate user navigate to Print page
    Then WL: expect user is navigated to print page