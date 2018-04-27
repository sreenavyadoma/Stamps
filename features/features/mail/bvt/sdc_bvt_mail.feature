Feature:  Mail BVT - Authentication

  Background:
    Given Start test driver




  @mail_authentication
  Scenario: Mail - Authentication
    Then visit Mail
    Then sign-in to Mail
    Then sign-out of SDC Website
