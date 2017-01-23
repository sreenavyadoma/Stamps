Feature: Able to collapse and reopen details panel when click Add order


  Background:
    Given I am signed in to Orders

  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then Orders Toolbar: Add
    Then Order Details: Collapse Panel
    Then Orders Toolbar: Add
    Then Order Details: Expect Panel is present

    Then Orders Toolbar: Add
    Then Order Details: Collapse Panel
    Then Order Details: Expand panel
    Then Order Details: Expect Panel is present




