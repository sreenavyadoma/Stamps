Feature: Registration Security questions page validation theme_1632

  Background:
    Given I loaded the default registration page

  @registration_ui_validation_security_questions_page
  Scenario:

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set How did you hear about us? to Magazine Ad
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page member address to random address between zone 1 and 4
    Then set Membership page Company to random value
    Then set Membership page Phone to random value
    Then set Membership page Cardholder's Name to random value
    Then set Membership page Credit Card Number to default value
    Then set Membership page Month to Dec (12)
    Then set Membership page Year to 2026
    Then check Membership page Terms & Conditions

    Then click Membership page Continue button

    Then on Registration ATG page continue to Registration Security questions page
    Then expect Registration navigation bar Stamps logo exists
    Then expect Registration navigation bar USPS logo exists
    Then expect Registration Security questions header contain Before you start printing postage, make sure your account is protected.
    Then expect Registration Security questions subheader contain To protect your account, please answer these security questions
    Then expect Registration Securityquestions first secret question dropup to contain what is your mother\'s maiden name?
    Then expect Registration Securityquestions first secret question dropup to contain what is your pet\'s name?
    Then expect Registration Securityquestions first secret question dropup to contain what is your city of birth?
    Then expect Registration Securityquestions first secret question dropup to contain what was your high school mascot?
    Then expect Registration Securityquestions first secret question dropup to contain what is your father\'s birthplace?
    Then expect Registration Securityquestions first secret question dropup to contain what street did you grow up on?
    Then expect Registration Securityquestions first secret question dropup to contain what is the name of your first school?
    Then expect Registration Securityquestions first secret question dropup to contain what is the make and model of your first car?
    Then expect Registration Securityquestions second secret question dropup to contain what is your mother\'s maiden name?
    Then expect Registration Securityquestions second secret question dropup to contain what is your pet\'s name?
    Then expect Registration Securityquestions second secret question dropup to contain what is your city of birth?
    Then expect Registration Securityquestions second secret question dropup to contain what was your high school mascot?
    Then expect Registration Securityquestions second secret question dropup to contain what is your father\'s birthplace?
    Then expect Registration Securityquestions second secret question dropup to contain what street did you grow up on?
    Then expect Registration Securityquestions second secret question dropup to contain what is the name of your first school?
    Then expect Registration Securityquestions second secret question dropup to contain what is the make and model of your first car?
    Then expect Registration Securityquestions get started button exists

    Then expect Profile page Privacy Policy link exists
    Then expect Profile page copyright link exists
   # Then expect Profile page Norton logo exists
    Then expect Profile page TRUSTe logo exists
    Then expect Profile page LIVE chat button exists




