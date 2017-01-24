Feature:  BVT International Shipping

  Background:
    Given A user is signed in to Orders

  @bvt_international_shipping
  Scenario: International Shipping

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then On Order Details form, set Ounces to 4
    Then On Order Details form, select service FCMI Large Envelope

    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 400, Origin Japan, Tariff 100
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, set Non-Delivery Options to Return to sender
    Then On Customs form, set Internal Transaction Number to Not required
    Then On Customs form, set More Info to "random"
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button

    Then In Orders Toolbar, click Print button
    Then In Print modal, click Close button

    Then Sign out
