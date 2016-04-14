Feature: Forgot Username



  Background:
    Given I visit postage sign-in page qacc

  @wp_forgot_username
  Scenario: Forgot Username

    Then Postage: Open Forgot Username Modal
    Then Postage: Set forgotten email to Win10FF1000@mailinator.com



