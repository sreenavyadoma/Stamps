
Feature: Mail Balance

  Background:
    Given I am signed in to Orders

  @general_settings

  Scenario: Mail Balance

    Then Open Settings Modal

    Then Settings:  Set Mail Balance to 0
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 0

    Then Settings:  Set Mail Balance to 10
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 10

    Then Settings:  Set Mail Balance to 25
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 25

    Then Settings:  Set Mail Balance to 50
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 50

    Then Settings:  Set Mail Balance to 100
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 100

    Then Settings:  Set Mail Balance to 250
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 250

    Then Settings:  Set Mail Balance to 500
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 500

    Then Settings:  Set Mail Balance to 0
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 0

    Then Settings:  Set Mail Balance to 0
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Mail Balance set to 0

    Then Settings:  Close

    Then Sign out

