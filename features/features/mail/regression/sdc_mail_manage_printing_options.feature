Feature: Manage Print Options

  Background:
    Given Start test driver

  @mail_manage_printing_options
  Scenario: Print On List Of Values
    Then sign-in to Mail
    Then select Print On Envelope - #12, 4 ¾" x 11"
    #Then select all options in manage printing options
    #Then select Print On Stamps

    Then Sign out