
Feature: As a batch shipper, I want to be able to filter orders by status [B-01621]

  Background:
    Given I am signed in as a batch shipper gc/auto39/326tsetaqcdS!

  @filters
  Scenario: User Views Filter Panel Default
    When Expect system displays expanded filters panel
    Then Expect system displays "Awaiting Shipment" and "Shipped" filters in panel
    And Expect system selects the Awaiting Shipment filter by default

    Then Click on the Filters panel border arrow
    Then Expect system closes Filters panel
    And Expect system shows name of Awaiting Shipment filter in closed panel
    Then Expect system shows an arrow above the Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the right direction

    Then Click on the Filters panel border arrow
    And Expect system opens the Filters panel
    Then Expect system hides the header arrow and Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the left direction


    Then Click on the Filters panel border arrow
    Then Expect system closes Filters panel
    And Expect system shows name of Awaiting Shipment filter in closed panel
    Then Expect system shows an arrow above the Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the right direction

    Then Click on the closed Filters panel
    And Expect system opens the Filters panel
    Then Expect system hides the header arrow and Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the left direction

    Then Click on the Filters panel border arrow
    Then Expect system closes Filters panel
    And Expect system shows name of Awaiting Shipment filter in closed panel
    Then Expect system shows an arrow above the Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the right direction

    Then Click on the Filters panel name
    And Expect system opens the Filters panel
    Then Expect system hides the header arrow and Order Status filter name
    And Expect system changes the panel arrow so that it is pointing to the left direction
    Then Sign out

  @filters
  Scenario: User Changes filters

    When Expect system displays expanded filters panel

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set single-order Ship-To country to United States
    Then Set Order Form Ship-To address to
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Ounces to 1

    Then Click on Awaiting Shipment Filter
    And Expect system selects Awaiting Shipment Filter and deselects the previous filter

    And Expect single-order form Order ID equals Grid order ID
    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com

    Then Print

    Then Click on Shipped Filter
    And Expect system selects Shipped Filter and deselects the previous filter
    And Expect system hides single-order form

    Then Expect Grid Recipient to be James Test
    Then Expect Grid Company to be Domestic Company
    Then Expect Grid Address to be 600 Front St Apt 220
    Then Expect Grid City to be San Diego
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 92101
    Then Expect Grid Phone to be 8885551212
    Then Expect Grid Email to be test@stamps.com


    And I Add a new order
    And Expect system selects Awaiting Shipment Filter and deselects the previous filter


    Then Sign out