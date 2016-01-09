Feature: International Shipping BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: International Shipping

    Then Select Print Postage print media <media>
    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Print Postage Form Ounces to <string>
    Then Set Print Postage Form Pounds to <string>
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Set customs form Non-Delivery Options to "Return to sender"
    Then Set customs form Internal Transaction Number to "Not required"
    Then Set customs form More Info to "BVT International Shipping"
    Then Set Customs Form I agree to Checked
    And Add Customs Form Item 1 - Description random, Qty 1, Price 100.50, Lbs 1, Oz 1 Origin United States, Tariff 100
    Then Close Customs Form
    Then Print Postage
    Then Sign out

