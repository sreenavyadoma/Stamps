Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cn22_paper_left
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name        | company             | street_address  | street_address_2| city | state | zip        | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  |                 | FPO  | AP    | 96349-0001 | United States | random | random |

    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, set Weight to 2 lb 1 oz
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, Add Item 2, Qty 2, ID random, Description random
    Then on Order Details form, Add Item 3, Qty 3, ID random, Description random

    Then on Order Details form, Delete Item 1
    Then on Order Details form, Delete Item 2

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In is United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
