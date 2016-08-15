Feature: Postage Shipping Label - 5 ½” x 8 ½” - PM Medium Flat Rate Box



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_shipping_label_5x8_pm_medium_box
  Scenario: Shipping Label - 5 ½” x 8 ½” - PM Medium Flat Rate Box

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Medium Flat Rate Box
    Then Postage Shipping Labels: Select left side starting label
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out