
Feature: Orders Filter Panel

  Background:
    Given A user is signed in to Orders

  @filter_panel
  @filter_change_tabs
  Scenario: Change Filter Panel Tabs
    * In left filter panel, expect selected filter is Awaiting Shipment
    * In left filter panel, select Shipped
    * In left filter panel, expect selected filter is Shipped
    * In left filter panel, select Canceled
    * In left filter panel, expect selected filter is Canceled
    * In left filter panel, select Awaiting Shipment
    * In left filter panel, expect selected filter is Awaiting Shipment
    * In left filter panel, select On Hold
    * In left filter panel, expect selected filter is On Hold
    * Sign out


  @filter_panel
  Scenario: Add Canceled Filter Panel - and Allow User to Manually Change Order Status
    * In Orders Toolbar, click Add button
    * In left filter panel, expect selected filter is Awaiting Shipment

    * Save Test Data
    * In Orders Grid, check saved Order ID
    * In Orders Grid toolbar, select Move to Shipped
    * In left filter panel, select Shipped
    * In Orders Grid, expect saved Order ID is in Orders Grid row 1
    * In left filter panel, expect Awaiting Shipment count decreased by 1

    * Save Test Data
    * In Orders Grid, check saved Order ID
    * In Orders Grid toolbar, select Move to Canceled
    * In left filter panel, select Canceled
    * In Orders Grid, expect saved Order ID is in Orders Grid row 1

    * Save Test Data
    * In Orders Grid, check saved Order ID
    * In Orders Grid toolbar, select Move to On Hold
    * In left filter panel, select On Hold
    * In Orders Grid, expect saved Order ID is in Orders Grid row 1

    * Save Test Data
    * In Orders Grid, check saved Order ID
    * In Orders Grid toolbar, select Move to Awaiting Shipment
    * In left filter panel, select Awaiting Shipment
    * In Orders Grid, expect saved Order ID is in Orders Grid row 1
    * In left filter panel, expect Awaiting Shipment count increased by 1
    * Sign out

