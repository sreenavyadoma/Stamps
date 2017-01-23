Feature:  BVT International Shipping

  Background:
    Given I am signed in to Orders

  @bvt_international_shipping
  Scenario: International Shipping

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Order Details: Set Ounces to 4
    Then Order Details: Select Service FCMI Large Envelope

    Then Order Details: Edit Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 400, Origin Japan, Tariff 100
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Set Non-Delivery Options to Return to sender
    Then Customs Form: Set Internal Transaction Number to Not required
    Then Customs Form: Set More Info to "random"
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form

    Then Print Modal: Open Print Modal
    Then Print Modal: Close Print Modal

    Then Sign out
