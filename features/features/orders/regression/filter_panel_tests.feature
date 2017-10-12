
@filter_panel_tests
Feature: Orders Filter Panel

  Background:
    Given a valid user is signed in to Web Apps

  @filter_panel
  Scenario: Filter Panel
    # default filter
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped

    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled

    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment

    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold

    Then add new order
    Then expect selected Filter is Awaiting Shipment
    Then expect cached Order ID is in Orders Grid row 1

    Then check orders grid cached order id
    Then select Grid Toolbar Move menu item Move to On Hold
    Then set Move to On Hold modal Hold Until date to today plus 1
    Then click Move to On Hold modal move button
    Then select Filter Panel tab On Hold
    Then expect selected Filter is On Hold
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check orders grid cached order id
    Then select Grid Toolbar Move menu item Move to Shipped
    Then expect Move to Shipped modal order number is correct
    Then click Move to Shipped modal move button
    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check orders grid cached order id
    Then select Grid Toolbar Move menu item Move to Canceled
    Then click Move to Canceled modal move button
    Then select Filter Panel tab Canceled
    Then expect selected Filter is Canceled
    Then expect cached Order ID exist in the selected filter

    Then search filtered Orders for cached Order ID
    Then check orders grid cached order id
    Then select Grid Toolbar Move menu item Move to Awaiting Shipment
    Then click Move to Awaiting Shipment modal move button
    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment
    Then expect cached Order ID exist in the selected filter
    Then Sign out

  @filters_user_views
  Scenario: User Views Filter Panel - Panel Default
    When In left Filter Panel, expect system displays expanded filters panel
    Then expect selected Filter is Awaiting Shipment

    Then Filter Panel: Collapse Panel
    Then In left Filter Panel, expect Filters panel is close

    Then Filter Panel: Expand Panel
    Then In left Filter Panel, expect Panel is open

    Then Sign out

  @filters_user_change
  Scenario: User Changes filters

    When In left Filter Panel, expect system displays expanded filters panel

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To Domestic address to
      | full_name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1

    Then select Filter Panel tab Awaiting Shipment
    Then expect selected Filter is Awaiting Shipment

    Then expect Orders Grid Recipient is James Test
    Then expect Orders Grid Company is Domestic Company
    Then expect Orders Grid Address is 600 Front St Apt 220
    Then expect Orders Grid City is San Diego
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 92101

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped

    Then expect Orders Grid Recipient is James Test
    Then expect Orders Grid Company is Domestic Company
    Then expect Orders Grid Address is 600 Front St Apt 220
    Then expect Orders Grid City is San Diego
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 92101

    Then add new order
    Then expect selected Filter is Awaiting Shipment

    Then Sign out
