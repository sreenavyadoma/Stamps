Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to United States
    Then Order Details - Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | random | random |
    Then Order Details - Set Weight to 2 lbs 1 oz
    Then Order Details - Set Service to "Parcel Select Ground Large Package"
    Then Open Customs Form
    Then Customs Form - Set Package Contents to "Merchandise"
    Then Customs Form - Add Item 1 - Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal - Set Media "Roll - 4" x 6" Shipping Label"
    Then Print Modal - Set Printer to "Designer"
    Then Print Sample
    Then Print
    Then Sign out
