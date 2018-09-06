Feature: Ruby/Cucumber Final Exam

  Background:
    Given Start test driver

  @google_search
  Scenario: <your name> - Google test
    Then visit www.google.com
    Then search for stamps.com
    Then verify result page contains stamps.com