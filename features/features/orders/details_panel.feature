Feature: B-01995 When Details Panel is Collapsed, Add Button Should Expand it


  Background:
    Given I am signed in to Orders

  @expand_order_details_panel
  Scenario: Able to collapse and reopen details panel when click Add order
    Then Add New Order
    Then Order Details: Collapse Panel
    Then Add New Order
    Then Order Details: Expect Panel Expanded

    Then Add New Order
    Then Order Details: Collapse Panel
    Then Order Details: Expand Order Details
    Then Order Details: Expect Panel Expanded




