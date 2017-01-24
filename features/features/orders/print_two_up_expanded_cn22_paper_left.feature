Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given A user is signed in to Orders

  @print_two_up_expanded_cn22_paper_left
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name        | company             | street_address  | street_address_2| city | state | zip        | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  |                 | FPO  | AP    | 96349-0001 | United States | random | random |

    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, set Weight to 2 lb 1 oz
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, Add Item 2, Qty 2, ID random, Description random
    Then On Order Details form, Add Item 3, Qty 3, ID random, Description random

    Then On Order Details form, Delete Item 1
    Then On Order Details form, Delete Item 2

    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select left-side label
    Then In Print modal, expect left-side label selected
    Then In Print modal, click Print button
    Then Sign out
