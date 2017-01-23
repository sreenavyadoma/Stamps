
Feature: Orders Filter Panel

  Background:
    Given I am signed in to Orders

  @filter_panel
  @filter_change_tabs
  Scenario: Change Filter Panel Tabs
    Then Filter Panel: Expect selected filter is Awaiting Shipment
    Then Filter Panel: Select Shipped
    Then Filter Panel: Expect selected filter is Shipped
    Then Filter Panel: Select Canceled
    Then Filter Panel: Expect selected filter is Canceled
    Then Filter Panel: Select Awaiting Shipment
    Then Filter Panel: Expect selected filter is Awaiting Shipment
    Then Filter Panel: Select On Hold
    Then Filter Panel: Expect selected filter is On Hold
    Then Sign out


  @filter_panel
  @filter_change_order_status
  Scenario: Add Canceled Filter Panel - and Allow User to Manually Change Order Status
    Then Orders Toolbar: Add
    Then Filter Panel: Expect selected filter is Awaiting Shipment

    Then Save Test Data
    Then Orders Toolbar: Move to Shipped
    Then Filter Panel: Select Shipped
    Then Orders Grid: Expect saved Order ID is in Orders Grid row 1
    Then Filter Panel: Expect Awaiting Shipment count decreased by 1

    Then Save Test Data
    Then Orders Grid: Check saved Order ID
    Then Orders Toolbar: Move to Canceled
    Then Filter Panel: Select Canceled
    Then Orders Grid: Expect saved Order ID is in Orders Grid row 1

    Then Save Test Data
    Then Orders Grid: Check saved Order ID
    Then Orders Toolbar: Move to On Hold
    Then Filter Panel: Select On Hold
    Then Orders Grid: Expect saved Order ID is in Orders Grid row 1

    Then Save Test Data
    Then Orders Grid: Check saved Order ID
    Then Filter Panel: Move order to Awaiting Shipment
    Then Filter Panel: Select Awaiting Shipment
    Then Orders Grid: Expect saved Order ID is in Orders Grid row 1
    Then Filter Panel: Expect Awaiting Shipment count increased by 1
    Then Sign out

