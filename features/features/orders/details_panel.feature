Feature: Able to collapse and reopen details panel when click Add order


  Background:
    Given I am signed in to Orders

  @expand_order_details_panel
  Scenario: B-01995 When Details Panel is Collapsed, Add Button Should Expand it
    Then Add New Order
    Then Details: Collapse Panel
    Then Add New Order
    Then Details: Expect Panel Expanded

    Then Add New Order
    Then Details: Collapse Panel
    Then Details: Expand Order Details
    Then Details: Expect Panel Expanded




