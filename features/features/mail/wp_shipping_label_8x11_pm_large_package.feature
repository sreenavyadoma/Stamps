Feature: Postage Shipping Label - 8 ½” x 11” Paper - PM Large Package



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_shipping_label_8x11_pm_large_package
  Scenario: Shipping Label - 8 ½” x 11” Paper - PM Large Package

    Then Postage: Select Shipping Label 8 x 11

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Large Package
    Then Postage Shipping Labels: Select left side starting label
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out