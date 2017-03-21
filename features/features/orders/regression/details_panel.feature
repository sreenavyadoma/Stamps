Feature: Able to collapse and reopen details panel when click Add order


  Background:
    Given a valid user is signed in to Web Apps

  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then click Orders Toolbar Add button
    Then on Order Details form, Collapse Panel
    Then click Orders Toolbar Add button
    Then expect Order Details form Panel is present

    Then click Orders Toolbar Add button
    Then on Order Details form, Collapse Panel
    Then on Order Details form, Expand panel
    Then expect Order Details form Panel is present




