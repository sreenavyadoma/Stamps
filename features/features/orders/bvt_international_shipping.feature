Feature:  BVT International Shipping

  Background:
    Given I am signed in to Orders

  @bvt_international_shipping
  Scenario: International Shipping

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Details: Set Ounces to 4
    Then Details: Select Service FCMI Large Envelope

    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 400, Origin Japan, Tariff 100
    Then Customs: Set Package Contents to Merchandise
    Then Customs: Set Non-Delivery Options to Return to sender
    Then Customs: Set Internal Transaction Number to Not required
    Then Customs: Set More Info to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Print: Open Modal
    Then Print: Close Modal

    Then Sign out
