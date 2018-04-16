@pp_reset_password
Feature: PP-MVP: Email Reset Password
   
  Background:
    Given PP: A user navigates to the Reset Password Page

  @pp_email_reset_password_page_ui_validation
  Scenario: Email Rest Password Page UI Validation
    Then PP: Expect Stamps Endicia Partner Portal Logo exists
    #Then PP: expect "Reset Password" exist
    Then PP:
