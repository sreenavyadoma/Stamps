Feature: Test Development
  Background:
    Given I am signed in as a batch shipper ff/qacc/auto01/password1

  @rob_dev1
  Scenario:
    And I Add a new order
    And Delete all Ship-From addresses and fail test if delete fails
    And Sign out
