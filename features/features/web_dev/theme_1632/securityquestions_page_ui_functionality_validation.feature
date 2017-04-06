Feature: WebReg Security questions page validation theme_1632

  Background:
    Given I launched default browser

  @securityquestions_page_ui_validation
  Scenario:
    Then Load WebReg Profile page
    Then set WebReg Profile email to email
    Then set WebReg Profile username to username
#
    Then set WebReg Profile password textbox to password
#
#
    Then set WebReg Profile email to email
    Then set WebReg Profile password to password
#
    Then set WebReg Profile retype password textbox to password
    Then set WebReg Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then on WebReg Profile page continue to Membership page
    Then set WebReg Membership first name text box to firstname
    Then set WebReg Membership last name text box to lastname
    Then set WebReg Membership company text box to company
    Then set WebReg Membership address text box to 1990 E Grand Ave
    Then set WebReg Membership city text box to city
    Then set WebReg Membership state text box to state
    Then set WebReg Membership zip text box to zip
    Then set WebReg Membership phone text box to phone
    Then set WebReg Membership cardholders name textbox to cardholdersname
    Then set WebReg Membership credit card number textbox to creditcardnumber
    Then set WebReg Membership month dropdown to month
    Then set WebReg Membership year to year
    Then set WebReg Membership billing address same as mailing address
    Then set WebReg Membership terms and condition
    Then on WebReg Membership page continue to Choose Supplies page
    Then on WebReg ATG page continue to WebReg Security questions page
    Then expect WebReg navigation bar Stamps logo exists
    Then expect WebReg navigation bar USPS logo exists
    Then expect WebReg Security questions header contain Before you start printing postage, make sure your account is protected.
    Then expect WebReg Security questions subheader contain To protect your account, please answer these security questions
    Then expect WebReg Securityquestions first secret question dropup to contain what is your mother\'s maiden name?
    Then expect WebReg Securityquestions first secret question dropup to contain what is your pet\'s name?
    Then expect WebReg Securityquestions first secret question dropup to contain what is your city of birth?
    Then expect WebReg Securityquestions first secret question dropup to contain what was your high school mascot?
    Then expect WebReg Securityquestions first secret question dropup to contain what is your father\'s birthplace?
    Then expect WebReg Securityquestions first secret question dropup to contain what street did you grow up on?
    Then expect WebReg Securityquestions first secret question dropup to contain what is the name of your first school?
    Then expect WebReg Securityquestions first secret question dropup to contain what is the make and model of your first car?
    Then expect WebReg Securityquestions second secret question dropup to contain what is your mother\'s maiden name?
    Then expect WebReg Securityquestions second secret question dropup to contain what is your pet\'s name?
    Then expect WebReg Securityquestions second secret question dropup to contain what is your city of birth?
    Then expect WebReg Securityquestions second secret question dropup to contain what was your high school mascot?
    Then expect WebReg Securityquestions second secret question dropup to contain what is your father\'s birthplace?
    Then expect WebReg Securityquestions second secret question dropup to contain what street did you grow up on?
    Then expect WebReg Securityquestions second secret question dropup to contain what is the name of your first school?
    Then expect WebReg Securityquestions second secret question dropup to contain what is the make and model of your first car?
    Then expect WebReg Securityquestions get started button exists
    Then expect WebReg Membership Privacy Policy link exists
#  and is clickable
    Then expect WebReg Membership copyright link exists
#  and is clickable
    Then expect WebReg Profile Norton logo exists
    Then expect WebReg Profile TRUSTe logo exists
    Then expect WebReg Profile LIVE chat button exists




