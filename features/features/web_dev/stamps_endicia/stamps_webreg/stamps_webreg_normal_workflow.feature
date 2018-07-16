Feature: Stamps WebReg: Normal Workflow
  Background:
    Given Start test driver

  @sdcwr_normal_workflow
  Scenario: Stamps WebReg: Normal Workflow
   # Profile Page
    Then WL: navigates to default registration page for stamps with the following source id random value
    Then WL: set profile page email to random value
    Then WL: set profile page username to random value
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: set profile page how did you hear about us? to Television Commercial
    Then WL: expect profile page promo code to equal source id promo code

    #Security Question before registration
    Then WL: if security question is present before registration then set the values

    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page personal info to random info between zone 9
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page credit card number to default value
    Then WL: select membership page credit card month Dec (12)
    Then WL: set membership page credit card year to this year plus 1
    Then WL: check membership page Terms & Conditions
    #Then WL: expect membership page Terms & Conditions is checked

    Then WL: click membership page submit button

    #Address Standardized
    Then WL: check if address standardized is present then click continue

    #postage meter address
    Then WL: check if postage meter address is present then set the value

    #Username  Taken
    Then WL: if username taken is present then set username to random value

    #Choose Supplies Page
    Then WL: check choose supplies page is present then verify the page and click place order button

    #Security Question after registration
    Then WL: if security question is present after registration then set the values

    Then WL: expect user is singed in to print