#Feature:  Mail Credentials Tests
##
##  Background:
##    Given Start test driver
##
##
##  @authentication
##  Scenario: Mail - Remember Username
##    Then visit Mail
##    Then sign-in to Mail
##    Then set username in Mail
##    Then set password in Mail
##    Then set Remember Username to Checked
##    Then click Sign In in Mail
##    Then sign-out of SDC Website
##    Then visit Mail
##    Then open sign in modal in Mail
##    Then expect username is present in username field
##    Then expect Remember Username is checked
##  te