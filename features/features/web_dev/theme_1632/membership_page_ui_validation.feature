Feature: WebReg Membership page validation theme_1632

  Background:
    Given I launched default browser

  @membership_page_ui_validation
  Scenario:
    Then Load WebReg Profile page
    Then set WebReg Profile email textbox and username textbox to random
    Then set WebReg Profile password textbox to pass1111
    Then set WebReg Profile retype password textbox to pass1111
    Then set WebReg Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then on WebReg Profile page, continue to Membership page
    Then expect WebReg navigation bar Stamps logo exists
    Then expect WebReg navigation bar USPS logo exists
    Then expect WebReg Membership bread crumbs to contain Profile
    Then expect WebReg Membership bread crumbs to contain Membership
    Then expect WebReg Membership bread crumbs to contain Choose Supplies
    Then expect WebReg Membership header contain Set up your personal Post Office
    Then expect WebReg Membership first name textbox exists
    Then expect WebReg Membership last name textbox exists
    Then expect WebReg Membership company textbox exists
    Then expect WebReg Membership address textbox exists
    Then expect WebReg Membership city textbox exists
    Then expect WebReg Membership state dropdown exists
    Then expect WebReg Membership phone textbox exists
    Then expect WebReg Membership stamps logo exists
    Then expect WebReg Membership usps logo exists
    Then expect WebReg Membership















  T
