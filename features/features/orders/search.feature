# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given a valid user is signed in to Web Apps

  @search_orders
  Scenario: Search order

    # Search for New Order ID
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1
    Then On Order Details form, set Email to random
    Then On Order Details form, set Phone to random
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Weight to 1 lb 1 oz

    Then In Orders Grid, uncheck saved Order ID

    Then Pause for 3 seconds
    Then Refresh Browser
    Then Pause for 5 seconds

    # Search for new order
    Then Filter Panel: Search saved Order ID
    Then Filter Panel: Search Results should be present
    Then Filter Panel: Search results count should be 1
    Then Filter Panel: Search results should be more than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present

    # Search for Ship Name
    Then Filter Panel: Search saved Ship Name
    Then Filter Panel: Search Results should be present
    Then Filter Panel: Search results count should be 1
    Then Filter Panel: Search results should be more than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present

    # Search for Ship Company
    Then Filter Panel: Search saved Ship Name
    Then Filter Panel: Search Results should be present
    Then Filter Panel: Search results count should be 1
    Then Filter Panel: Search results should be more than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present

    # Search for Email
    Then Filter Panel: Search saved Email
    Then Filter Panel: Search saved Email
    Then Filter Panel: Search Results should be present
    Then Filter Panel: Search results count should be 1
    Then Filter Panel: Search results should be more than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present
    Then Sign out

