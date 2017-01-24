
Feature: Mail Balance

  Background:
    Given A user is signed in to Orders

  @general_settings

  Scenario: Mail Balance

    Then Open Settings Modal

    Then In Settings modal,  Set Mail Balance to 0
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 0

    Then In Settings modal,  Set Mail Balance to 10
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 10

    Then In Settings modal,  Set Mail Balance to 25
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 25

    Then In Settings modal,  Set Mail Balance to 50
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 50

    Then In Settings modal,  Set Mail Balance to 100
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 100

    Then In Settings modal,  Set Mail Balance to 250
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 250

    Then In Settings modal,  Set Mail Balance to 500
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 500

    Then In Settings modal,  Set Mail Balance to 0
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 0

    Then In Settings modal,  Set Mail Balance to 0
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Mail Balance set to 0

    Then In Settings modal,  Close

    Then Sign out

