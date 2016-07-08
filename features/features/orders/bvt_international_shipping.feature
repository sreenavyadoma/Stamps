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
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Set Non-Delivery Options to "Return to sender"
    Then Customs: Set Internal Transaction Number to "Not required"
    Then Customs: Set More Info to "BVT International Shipping"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Sign out
