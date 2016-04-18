Feature:Shipping Label Preview Panel 



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_preview_panel_options
  Scenario: Shipping Label Preview Panel

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Set Hide Postage Value to Checked
    Then Shipping Labels: Set Hide Postage Value to Unchecked
    Then Shipping Labels: Set Print Reference Number to Checked
    Then Shipping Labels: Set Print Reference Number to Unchecked
    Then Shipping Labels: Set Print Receipt to Checked
    Then Shipping Labels: Set Print Receipt to Unchecked
    Then Shipping Labels: Set Reference Number to test12435
    Then Shipping Labels: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out