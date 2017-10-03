# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given a valid user is signed in to Web Apps

  @search_orders
  Scenario: Search order
    # Search for New Order ID
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Email to random
    Then set Order Details form Phone to random
    Then hide order details form Ship-To fields
    Then set Order Details form service to PM Package
    Then set Order Details form Weight to 1 lb 1 oz
    Then uncheck orders grid cached order id
    Then select Filter Panel tab Shipped

#    # Search for Email
#    Then select Filter Panel tab Awaiting Shipment
#    Then search filtered Orders for cached Ship-To email
#    Then expect Filter Panel search results tab is present
#    Then expect Filter Panel search result count is 1
#    Then expect Filter Panel search result count is greater than 0
#    Then remove Filter Panel search results tab
#    Then expect Filter Panel search results tab is not present

    # Search for new order
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Order ID
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Name
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Ship-To full name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present

    # Search for Ship Company
    Then select Filter Panel tab Awaiting Shipment
    Then search filtered Orders for cached Ship-To full name
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present
    Then Sign out

