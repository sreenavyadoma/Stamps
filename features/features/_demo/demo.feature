

Feature: Browser Page Object Tests
  Background:
    Given Start test driver

  @google
  Scenario: google search
    Then set google search textbox to Stamps.com