Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cn22_paper_left
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name        | company             | street_address  | street_address_2| city | state | zip        | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  |                 | FPO  | AP    | 96349-0001 | United States | random | random |

    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Set Weight to 2 lb 1 oz
    Then Order Details: Add Item 1, Qty 1, ID random, Description random
    Then Order Details: Add Item 2, Qty 2, ID random, Description random
    Then Order Details: Add Item 3, Qty 3, ID random, Description random

    Then Order Details: Delete Item 1
    Then Order Details: Delete Item 2

    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Print Modal: Expect left-side label selected
    Then Print Modal: Print
    Then Sign out
