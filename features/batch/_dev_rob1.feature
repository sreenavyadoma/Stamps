Feature: Test Development

  @rob_dev1
  Scenario:
    And I am signed in as a batch shipper ff/qacc/auto04/password1
    And I Add a new order
    And Delete all Ship-From addresses and fail test if delete fails
    And Sign out

    And I am signed in as a batch shipper ff/qacc/auto40/password1
    And I Add a new order
    And Delete all Ship-From addresses and fail test if delete fails
    And Sign out