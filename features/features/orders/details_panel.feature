Feature: Able to collapse and reopen details panel when click Add order


  Background:
    Given a valid user is signed in to Web Apps

  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then in Orders Toolbar, click Add button
    Then on Order Details form, Collapse Panel
    Then in Orders Toolbar, click Add button
    Then on Order Details form, expect Panel is present

    Then in Orders Toolbar, click Add button
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then on Order Details form, expect Panel is present




