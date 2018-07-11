Feature: Stamps WebReg: Normal Workflow
  Background:
    Given Start test driver

  @sdcwr_normal_workflow
  Scenario: Stamps WebReg: Normal Workflow
   # Profile Page
    Then WL: navigates to default registration page for stamps
    Then WL: set profile page email to random value
    Then WL: set profile page username to random value
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: set profile page survey question to Individual/Home Office
    Then WL: set profile page how did you hear about us? to Television Commercial
    Then WL: set profile page promo code to PR33-NH77

    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page personal info to random info between zone 1 and 4
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page credit card number to default value
    Then WL: select membership page credit card month Dec (12)
    Then WL: set membership page credit card year to this year plus 1
    Then WL: check membership page Terms & Conditions
    #Then WL: expect membership page Terms & Conditions is checked

    Then WL: click membership page submit button

    #Choose Supplies Page
    Then WL: click choose supplies page place order button
