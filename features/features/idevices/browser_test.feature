

Feature: Browser Page Object Tests
  Background:
    Given Start test driver

  @browser_test
  Scenario: Browser Page Object Test
    Then navigates to a simple url
    Then navigates to a dynamic url
    Then enters text into a textfield based on value it is set equal to
    Then selects value from dropdown based on value it is set equal to
#    Then selects radio button based being set equal to a true value
    Then selects checkbox based on being set equal to a true value
    Then deselects checkbox based on being set equal to a true value
    Then clicks button based on being set equal to a true value
#    Then throws custom error message in waits







