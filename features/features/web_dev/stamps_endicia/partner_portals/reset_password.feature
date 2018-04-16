@sdc_endicia_pp_dashboard
Feature: PP-MVP: Email Reset Password
   
  Background:
    Given PP: A user navigates to the Reset Password Page

  @sdc_endicia_pp_email_reset_password_page_ui_validation
  Scenario: Email Rest Password Page UI Validation
    Then PP: expect "Reset Password" exist
    Then PP:
