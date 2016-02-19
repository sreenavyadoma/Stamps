Feature: Registration
  Background:
    Given I launch browser default

  @pam
  Scenario:
    Then PAM:  Load QA Payment Administration Manager Page
    Then PAM:  Authentication Required
