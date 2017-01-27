
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel
    Then In left filter panel, expect selected filter is Awaiting Shipment
    Then In left filter panel, select Shipped
    Then In left filter panel, expect selected filter is Shipped
    Then In left filter panel, select Canceled
    Then In left filter panel, expect selected filter is Canceled
    Then In left filter panel, select Awaiting Shipment
    Then In left filter panel, expect selected filter is Awaiting Shipment
    Then In left filter panel, select On Hold
    Then In left filter panel, expect selected filter is On Hold

    Then In Orders Toolbar, click Add button
    Then In left filter panel, expect selected filter is Awaiting Shipment

    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Shipped
    Then In left filter panel, select Shipped
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1
    Then In left filter panel, expect Awaiting Shipment count decreased by 1

    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Canceled
    Then In left filter panel, select Canceled
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1

    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to On Hold until today plus 3
    Then In left filter panel, select On Hold
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1

    Then In Orders Grid, check saved Order ID
    Then In Orders Grid toolbar, select Move to Awaiting Shipment
    Then In Orders Grid, expect saved Order ID is in Orders Grid row 1
    Then In left filter panel, expect Awaiting Shipment count increased by 1
    Then Sign out