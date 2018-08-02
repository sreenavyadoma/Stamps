Feature: Stamps WebReg: Security Quetions Workflow

  Background:
    Given Start test driver

  @sdcwr_security_quetions_ui_validation
  Scenario: Security Quetions Page Validation
  #Security Question in the end
   # Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 399
    Then WL: set profile page default values

    #Validate Security Quetions Modal does not present
    Then WL: expect security question modal does not exists

    Then WL: click profile page continue button

    #Membership Page
    Then pause for 2 seconds
    Then WL: set membership page default values
    Then WL: click membership page submit button

    #Security Question UI Validation
    Then WL: expect security questions header to be Before you start printing postage, make sure your account is protected.
    Then WL: expect security questions title to be To protect your account, please answer these security questions:
    Then WL: expect security questions get started button exists
    Then WL: click security questions get started button

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

    # Validate second Security Question list
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

  #Security Question in Profile Page
    Then WL: navigates to default registration page for stamps with the following offer id 391
    Then WL: set profile page default values

    #Validate Security Question Modal
    #Validate first Security Question list
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