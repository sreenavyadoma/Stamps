Feature: Registration
  Background:
    Given I launch default browser

  @pam
  Scenario:
    Then PAM:  Load QA Payment Administration Manager Page
    Then PAM:  Authentication Required
