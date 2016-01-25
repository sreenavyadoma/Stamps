Feature: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name     | company       | street_address      | city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  | DPO  | AE    | 09498-9997 | United States | random | random |
    Then Order Details: Set Weight to 3 lbs 2 oz
    Then Order Details: Set Service to "Parcel Select Ground Package"
    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Other"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print Modal: Set Printer to "Designer"
    Then Print Modal: Print Sample
    Then Toolbar: Print
    Then Sign out
