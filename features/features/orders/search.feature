# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given I am signed in to Orders

#  @search_orders
#  Scenario: Search for an existing order
#    Then Left Panel: Search for 1474915969638
#    Then Left Panel: Search Results should be present
#    Then Left Panel: Search results count should be 1
#    Then Left Panel: Search results should be more than 0
#    Then Left Panel: Remove search results
#    Then Left Panel: Search Results should not be present
#    Then Sign out

  @search_orders
  Scenario: Search for an existing order
    # New Order
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Weight to 1 lbs 1 oz
    # Search for new order
    Then Left Panel: Search saved Order ID
    Then Left Panel: Search Results should be present
    Then Left Panel: Search results count should be 1
    Then Left Panel: Search results should be more than 0
    Then Left Panel: Remove search results
    Then Left Panel: Search Results should not be present

    Then Sign out


