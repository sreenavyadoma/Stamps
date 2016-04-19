Feature: Forgot Username



  Background:
    Given I launch browser

  @wp_forgot_username
  Scenario: Forgot Username
    Then I visit postage sign-in page
    Then Postage: Open Forgot Username Modal
    Then Postage: Set forgotten email to Win10FF1000@mailinator.com



