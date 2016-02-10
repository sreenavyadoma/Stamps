Feature: International Shipping BVT



  Background:
    Given I am signed in as a postage shipper


  @wp_international
  Scenario: International Shipping

    Then Print Postage: Select Print On Shipping Label - 5 ½” x 8 ½”
    Then Shipping Labels: Set Ship-From to default
    Then International: Set Ship-To to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  |
    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1

    Then Sign out


  Scenario: International Shipping 2

    And Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Customs Form: Set Internal Transaction Number to "Not required"
    Then Customs Form: Set More Info to "BVT International Shipping"
    Then Customs Form: Set I agree to Checked
    And Customs Form: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Close Customs Form


    And Open Print Postage Customs Form
    Then Print Postage Customs Form: Set Package Contents to "Merchandise"
    Then Print Postage Customs Form: Set Non-Delivery Options to "Return to sender"
    Then Print Postage Customs Form: Set Internal Transaction Number to "Not required"
    Then Print Postage Customs Form: Set More Info to "BVT International Shipping"
    Then Print Postage Customs Form: Set I agree to Checked
    And Print Postage Customs Form: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Close Print Postage Customs Form
    Then Footer: Print Postage
    Then Sign out

