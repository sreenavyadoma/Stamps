Feature: Endicia WebReg: Workflow

  Background:
    Given Start test driver

  @ewwr_offer_707_workflow
  Scenario: Endicia WebReg: Default Offer 707 Print Landing Page Workflow
    Then WL: navigates to default registration page for endicia with the following offer id 707

    Then WL: set profile page default values
    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: select security questions first security question What street did you grow up on?
    Then WL: set security questions first security answer to Grand Ave
    Then WL: select security questions second security question What is the make and model of your first car?
    Then WL: set security questions second security answer to random value

    Then WL: click security questions get started button

    Then WL: expect user is navigated to print page for endicia

  @ewwr_session_state_data_validation
  Scenario: Endicia WebReg: Session State Data Validation
    Then WL: navigates to default registration page for endicia with the following offer id 707
    Then WL: set profile page default values

    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: set membership page cardholder's name to random value
    Then WL: set membership page billing address to 1990 E Grand Ave
    Then WL: set membership page billing city to El Segundo
    Then WL: select membership page billing state CA
    Then WL: set membership page billing zip to 90245
    Then WL: click membership page back button

  #Validate profile page data are present
    Then WL: expect profile page default values are correct


    Then WL: click profile page continue button

  #Validate Membership page data are present
    Then WL: expect membership page default values are correct
    Then WL: expect membership page credit card number is ************1111
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct

    Then WL: set membership page address to Po Box 7
    Then WL: set membership page city to Manchester
    Then WL: select membership page state KY
    Then WL: set membership page zip to 40962-0007
    Then WL: click membership page submit button

    Then WL: set postage meter address between zone 5 and zone 8

  #Validate Membership page data are present
    Then WL: click membership page back button
    Then WL: expect membership page default values are correct
    Then WL: expect membership page credit card number is ************1111
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct

    Then WL: click membership page back button
  #Validate profile page data are present
    Then WL: expect profile page default values are correct

  #Validate Membership page data are present
    Then WL: click profile page continue button
    Then WL: expect membership page default values are correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing city is correct
    Then WL: expect membership page billing state is correct
    Then WL: expect membership page billing zip is correct
    Then WL: click membership page submit button

  #Validate Postage Meter Page data are present
    Then WL: expect postage meter values are correct

    Then WL: browser refresh
    Then WL: navigate to www.google.com
    Then WL: navigate back

  #Validate profile page data are present
    Then WL: expect profile page password is empty
    Then WL: expect profile page re-type password is empty
    Then WL: set profile page password to random value
    Then WL: set profile page re-type password to same as previous password
    Then WL: expect profile page default values are correct

    Then WL: click profile page continue button

  #Validate Membership page data are present
    Then WL: expect membership page credit card number is empty
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: set membership page credit card number to default value
    Then WL: expect membership page default values are correct

    Then WL: check membership page terms & conditions
    Then WL: click membership page submit button

  #Validate Postage Meter Page data are present
    Then WL: expect postage meter values are correct


