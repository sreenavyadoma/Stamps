Feature: Registration Security questions page validation theme_1632

  Background:
    Given I loaded registration profile page 1632

  @securityquestions_page_ui_validation
  Scenario:
    Then set Profile page email to email
    Then set Profile page username to username
    Then set Profile page password to password
    Then set Profile page retype password textbox to password
    Then set Profile page Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then on Profile page page, continue to Membership page
    Then set Registration Membership first name text box to firstname
    Then set Registration Membership last name text box to lastname
    Then set Registration Membership company text box to company
    Then set Registration Membership address text box to 1990 E Grand Ave
    Then set Registration Membership city text box to city
    Then set Registration Membership state text box to state
    Then set Registration Membership zip text box to zip
    Then set Registration Membership phone text box to phone
    Then set Registration Membership cardholders name textbox to cardholdersname
    Then set Registration Membership credit card number textbox to creditcardnumber
    Then set Registration Membership month dropdown to month
    Then set Registration Membership year to year
    Then set Registration Membership billing address same as mailing address
    Then set Registration Membership terms and condition
    Then on Registration Membership page continue to Choose Supplies page
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
    Then expect Profile page Norton logo exists
    Then expect Profile page TRUSTe logo exists
    Then expect Profile page LIVE chat button exists




