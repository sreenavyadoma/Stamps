# Order: OrderNumber, ShipName, ShipCompany, Username, +BuyerEmail +OrderItem: SKU, Description
Feature:  Basic Search

  Background:
    Given I am signed in to Orders

  @bvt_shipstation_search
  Scenario: Search order

    # Search for New Order ID
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Set Email to random
    Then Order Details: Set Phone to random
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 1 lb 1 oz

    Then Orders Grid: Uncheck Saved Order ID

    Then Pause for 3 seconds
    Then Refresh Browser
    Then Pause for 5 seconds

    # Search for new order
    Then Filter Panel: Search saved Order ID
    Then Filter Panel: Search Results should be present
    Then Filter Panel: Search results count should be 1

    Then Orders Grid: Check saved Order ID
    Then Order Details: Expect Order ID equals Grid Oder ID in row 1
    Then Order Details: Expect Order ID is the same as saved Order ID

    Then Filter Panel: Search results should be more than 0
    Then Filter Panel: Remove search results
    Then Filter Panel: Search Results should not be present

    Then Sign out


