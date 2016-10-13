Feature: Mail Shipping Label - 8 ½” x 11” Paper - PSG Large Package



  Background:
    Given I am signed in as Mail shipper


  @wp_shipping_label_8x11_psg_large_package
  Scenario: Shipping Label - 8 ½” x 11” Paper - PSG Large Package

    Then Mail: Select Shipping Label 8 x 11

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Parcel Select Ground Large Package
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out