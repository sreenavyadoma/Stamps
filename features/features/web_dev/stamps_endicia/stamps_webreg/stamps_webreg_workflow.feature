Feature: Stamps WebReg: Normal Workflow
  Background:
    Given Start test driver

  @sdcwr_random_workflow
  Scenario: Stamps WebReg: Normal Workflow
   # Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id random value
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
    Then WL: set membership page personal info to random info between zone 1 and zone 9
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page credit card number to default value
    Then WL: select membership page credit card month Dec (12)
    Then WL: set membership page credit card year to this year plus 1
    Then WL: check membership page Terms & Conditions
    #Then WL: expect membership page Terms & Conditions is checked

    Then WL: click membership page submit button

    #Address Standardized
    Then WL: check if address standardized is present then click continue

    #Postage Meter Address
    Then WL: check if postage meter address is present then set the value

    #Username  Taken
    Then WL: if username taken is present then set username to random value

    #Choose Supplies Page
    Then WL: check choose supplies page is present then verify the page and click place order button

    #Security Question after registration
    Then WL: if security question is present after registration then set the values

    Then WL: expect user is navigated to print page

  @sdcwr_offer_573_workflow
  Scenario: Stamps WebReg: Offer 573 Workflow
    #Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 573
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace? 
    Then WL: set security questions first security answer to Los Angeles 
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page default values
    Then WL: click membership page submit button

    #Choose Supplies Page
    Then WL: expect choose supplies page header to be Customize your Welcome Kit
    Then WL: expect choose supplies page paragraph index 1 to be
    """
    Thank you for signing up for Stamps.com. Your free Welcome Kit is on its way. Customize your welcome kits with HP specific products by selecting the options below.
    """
    Then WL: click choose supplies page place order button

    #Offer 573 Landing Page
    Then WL: expect offer 573 landing page header to be Congratulations!
    Then WL: expect offer 573 landing page sub header paragraph to be
    """
    You are now ready to print postage with your HP Printer.
    Simply select the Stamps.com App on your printer to get started.
    """
    Then WL: expect offer 573 landing page hp upgrade paragraph to be
    """
    Want to print shipping labels and envelopes? Click here to upgrade to our Complete Plan.
    """
    Then WL: expect offer 573 landing page shipping labels img is present

  @sdcwr_offer_592_workflow
  Scenario: Stamps WebReg: Offer 592 Workflow
  #Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 592
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

  #Membership Page
    Then WL: set membership page default values
    Then WL: click membership page submit button

  #Offer 592 Conformation/Landing Page
    Then WL: expect offer 592 landing page header to be Congratulations on your new account!
    Then WL: expect offer 592 landing page paragraph index 1 to be
    """
    You will receive an email confirmation of your registration.
    """
    Then WL: expect offer 592 landing page paragraph index 2 to be
    """
    Your account is ready to use. Please return to Avery to start printing postage.
    """
    Then WL: click offer 592 landing page continue button

    Then WL: expect offer 592 landing page avery img is present

  @sdcwr_offer_399_workflow
  Scenario: Stamps WebReg: Default Offer Workflow
    Then WL: navigates to default registration page for stamps with the following offer id 399
    Then WL: set profile page default values
    Then WL: set profile page promo code to PR33-NH77
    Then WL: click profile page continue button
    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: expect choose supplies page header to be Customize your Welcome Kit
    Then WL: expect choose supplies page paragraph index 1 to be
    """
    Thank you for signing up for Stamps.com. Your free Welcome Kit is on its way. Included in the kit is a set of label sheets for printing stamps or shipping labels.
    """
    Then WL: expect choose supplies page paragraph index 3 to be
    """
    If you want to add a free postal scale (just pay S&H) or additional labels or supplies, please select below.
    """
    Then WL: select choose supplies postal scale selection 2
    Then WL: select choose supplies original NetStamps label sheet selection 2
    Then WL: select choose supplies patriotic NetStamps label sheet selection 1
    Then WL: select choose supplies postage, delivery, and return address labels selection 1
    Then WL: click choose supplies page place order button


    Then WL: select security questions first security question What is your pet's name?
    Then WL: set security questions first security answer to random value
    Then WL: select security questions second security question What is the make and model of your first car?
    Then WL: set security questions second security answer to random value
    Then WL: click security questions get started button
    Then WL: expect user is navigated to print page

  @sdcwr_offer_556_workflow
  Scenario: Stamps WebReg: Default Offer Workflow
    Then WL: navigates to default registration page for stamps with the following offer id 556
    Then WL: set profile page default values
    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar
    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: expect choose supplies page is not present
