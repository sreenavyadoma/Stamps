Feature:  BVT International Shipping

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_international_shipping
  Scenario: International Shipping

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then on Order Details form, set Ounces to 4
    Then on Order Details form, select service FCMI Large Envelope

    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 400, Made In is Japan, Tariff 100
    Then set Customs form Package Contents to Merchandise
    Then set Customs form Non-Delivery Options to Return to sender
    Then set Customs form Internal Transaction Number to Not required
    Then set Customs form More Info to random
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button

    Then in Orders Toolbar, click Print button
    Then in Print modal, click Close button

    Then Sign out
