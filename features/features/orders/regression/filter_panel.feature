
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel
    Then in left Filter Panel, expect selected filter is Awaiting Shipment
    Then click Filter Panel Shipped tab
    Then in left Filter Panel, expect selected filter is Shipped
    Then click Filter Panel Canceled tab
    Then in left Filter Panel, expect selected filter is Canceled
    Then click Filter Panel Awaiting Shipment tab
    Then in left Filter Panel, expect selected filter is Awaiting Shipment
    Then click Filter Panel On Hold tab
    Then in left Filter Panel, expect selected filter is On Hold

    Then add new order
    Then in left Filter Panel, expect selected filter is Awaiting Shipment
    Then expect Orders Grid saved Order ID is in Orders Grid row 1

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Shipped
    Then click Filter Panel Shipped tab
    Then in left Filter Panel, expect selected filter is Shipped
    Then in left Filter Panel, expect saved Order ID is in Shipped

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Canceled
    Then click Filter Panel Canceled tab
    Then in left Filter Panel, expect selected filter is Canceled
    Then in left Filter Panel, expect saved Order ID is in Canceled

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to On Hold until today plus 3
    Then click Filter Panel On Hold tab
    Then in left Filter Panel, expect selected filter is On Hold
    Then in left Filter Panel, expect saved Order ID is in On Hold

    Then check Orders Grid saved Order ID
    Then in Orders Grid toolbar, select Move to Awaiting Shipment
    Then click Filter Panel Awaiting Shipment tab
    Then in left Filter Panel, expect selected filter is Awaiting Shipment
    Then in left Filter Panel, expect saved Order ID is in Awaiting Shipment
    Then Sign out