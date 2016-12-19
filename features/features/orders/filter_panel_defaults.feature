
Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

  @filters
  Scenario: User Views Filter Panel - Panel Default
    When Left Panel: Expect system displays expanded filters panel
    Then Left Panel: Expect system displays "Awaiting Shipment" and "Shipped" filters in panel
    Then Left Panel: Expect system selects the Awaiting Shipment Filter Panel - by default

    Then Left Panel: Click on panel
    Then Left Panel: Expect Filters panel is close
    Then Left Panel: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Left Panel: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Left Panel: Expect panel arrow is pointing to the right direction

    Then Left Panel: Click on panel
    Then Left Panel: Expect Panel is open
    Then Left Panel: Expect panel is hidden
    Then Left Panel: Expect panel arrow is pointing to the left direction


    Then Left Panel: Click on panel
    Then Left Panel: Expect Filters panel is close
    Then Left Panel: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Left Panel: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Left Panel: Expect panel arrow is pointing to the right direction

    Then Left Panel: Click on the closed Filters panel
    Then Left Panel: Expect Panel is open
    Then Left Panel: Expect panel is hidden
    Then Left Panel: Expect panel arrow is pointing to the left direction

    Then Left Panel: Click on panel
    Then Left Panel: Expect Filters panel is close
    Then Left Panel: Expect system shows name of Awaiting Shipment Filter Panel - in closed panel
    Then Left Panel: Expect system shows an arrow above the Order Status Filter Panel - name
    Then Left Panel: Expect panel arrow is pointing to the right direction

    Then Left Panel: Click panel name
    Then Left Panel: Expect Panel is open
    Then Left Panel: Expect panel is hidden
    Then Left Panel: Expect panel arrow is pointing to the left direction
    Then Sign out

  @filters
  Scenario: User Changes filters

    When Left Panel: Expect system displays expanded filters panel

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To to Domestic Address
      | name   | company      | street_address      | city | state | zip        | country       | phone  |  email |
      | James Test | Domestic Company | 600 Front St Apt 220 | San Diego | CA | 92101-6733 | United States | 8885551212 | test@stamps.com |
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1

    Then Left Panel: Select Awaiting Shipment
    Then Left Panel: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter

    Then Details: Expect Order ID equals Grid Oder ID in row 1
    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Left Panel: Select Shipped
    Then Left Panel: Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Grid: Expect Recipient is James Test
    Then Grid: Expect Company is Domestic Company
    Then Grid: Expect Address is 600 Front St Apt 220
    Then Grid: Expect City is San Diego
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 92101
    Then Grid: Expect Phone is 8885551212
    Then Grid: Expect Email is test@stamps.com


    Then Toolbar: Add
    Then Left Panel: Expect system selects Awaiting Shipment Filter Panel - and deselects the previous filter


    Then Sign out

    #todo - rob