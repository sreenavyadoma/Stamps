
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel

    Then expect selected Filter is Awaiting Shipment
    Then select Filter Panel Shipped tab
    Then expect selected Filter is Shipped
    Then select Filter Panel Canceled tab
    Then expect selected Filter is Canceled
    Then select Filter Panel Awaiting Shipment tab
    Then expect selected Filter is Awaiting Shipment
    Then select Filter Panel On Hold tab
    Then expect selected Filter is On Hold

    Then add new order
    Then expect selected Filter is Awaiting Shipment
    Then expect saved Order ID is in Orders Grid row 1

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Shipped
    Then select Filter Panel Shipped tab
    Then expect selected Filter is Shipped
    Then expect saved Order ID is filtered in Shipped

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Canceled
    Then select Filter Panel Canceled tab
    Then expect selected Filter is Canceled
    Then expect saved Order ID is filtered in Canceled

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to On Hold until today plus 3
    Then select Filter Panel On Hold tab
    Then expect selected Filter is On Hold
    Then expect saved Order ID is filtered in On Hold

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Awaiting Shipment
    Then select Filter Panel Awaiting Shipment tab
    Then expect selected Filter is Awaiting Shipment
    Then expect saved Order ID is filtered in Awaiting Shipment
    Then Sign out