Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cn22_paper_left
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To domestic address to
      | name        | company             | street_address  | street_address_2| city | state | zip        | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  |                 | FPO  | AP    | 96349-0001 | United States | random | random |

    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Add Item 2, Qty 2, ID random, Description random
    Then Details: Add Item 3, Qty 3, ID random, Description random

    Then Details: Delete Item 1
    Then Details: Delete Item 2

    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
