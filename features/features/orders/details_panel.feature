Feature: Able to collapse and reopen details panel when click Add order


  Background:
    Given a valid user is signed in to Web Apps

  @details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then In Orders Toolbar, click Add button
    Then On Order Details form, Collapse Panel
    Then In Orders Toolbar, click Add button
    Then On Order Details form, expect Panel is present

    Then In Orders Toolbar, click Add button
    Then On Order Details form, Collapse Panel
    Then On Order Details form, Expand panel
    Then On Order Details form, expect Panel is present




