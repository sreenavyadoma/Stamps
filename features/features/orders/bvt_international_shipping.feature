Feature:  BVT International Shipping

  Background:
    Given I am signed in to Orders

  @orders_bvt_international_shipping
  Scenario: International Shipping

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Details: Set Ounces to 4
    Then Details: Select Service First-Class Mail International Large Envelope/Flat

    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 1000, Origin Japan, Tariff 100
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Not required"
    Then Customs: Set More Info to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Sign out
