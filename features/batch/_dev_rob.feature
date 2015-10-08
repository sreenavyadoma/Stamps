Feature: Test Development

  Background:
    Given I am signed in as a batch shipper ff/qacc/auto40/password1

    @rob_dev
  Scenario:
    Then Expect order-grid Ship Cost error to contain "Some error"