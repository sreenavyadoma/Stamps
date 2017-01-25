
Feature: Orders Filter Panel

  Background:
    Given A user is signed in to Orders

  @filter_panel
  @filter_change_tabs
  Scenario: Change Filter Panel Tabs
    Then In left filter panel, expect selected filter is Awaiting Shipment
    Then In left filter panel, select Shipped
    Then In left filter panel, expect selected filter is Shipped
    Then In left filter panel, select Canceled
    Then In left filter panel, expect selected filter is Canceled
    Then In left filter panel, select Awaiting Shipment
    Then In left filter panel, expect selected filter is Awaiting Shipment
    Then In left filter panel, select On Hold
    Then In left filter panel, expect selected filter is On Hold
    Then Sign out


  @filter_change_order_status
  Scenario: Move order to Shipped, Cancelled, On Hold and Awaiting Shipment
    Then In Orders Toolbar, click Add button
    Then In left filter panel, expect selected filter is Awaiting Shipment

    Then Save Test Data
    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Shipped
    Then In left filter panel, select Shipped
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1
    Then In left filter panel, expect Awaiting Shipment count decreased by 1

    Then Save Test Data
    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Canceled
    Then In left filter panel, select Canceled
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1

    Then Save Test Data
    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to On Hold
    Then In left filter panel, select On Hold
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1

    Then Save Test Data
    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Awaiting Shipment
    Then In left filter panel, select Awaiting Shipment
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1
    Then In left filter panel, expect Awaiting Shipment count increased by 1
    Then Sign out

