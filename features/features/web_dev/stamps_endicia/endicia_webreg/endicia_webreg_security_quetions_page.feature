Feature: Endicia WebReg: Security Question Workflow

  Background:
    Given Start test driver

  @ewwr_security_question_page_validation
  Scenario: Security Question Page Validation

    Then WL: navigates to default registration page for endicia with the following offer id 707

   # Profile Page
    Then WL: set profile page default values
    Then WL: click profile page continue button

    #Validate Security Question header is not present
    Then WL: expect profile security questions header is not present
    Then WL: click profile page continue button

    #Membership Page
    Then WL: set membership page default values
    Then WL: click membership page submit button

    #Security Question UI Validation
    Then WL: expect security questions header to be Before you start printing postage, make sure your account is protected.
    Then WL: expect security questions title to be To protect your account, please answer these security questions:
    Then WL: expect security questions get started button exists
    Then WL: click security questions get started button

    #Validate first Security Question Help Block
    Then WL: expect security question page tooltip to be This field is required

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

    Then WL: set security questions first security answer to random value

    #Validate second Security Question list
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

    Then WL: set security questions second security answer to random value

    Then WL: click security questions get started button

    Then WL: expect user is navigated to print page