Feature: Mail Shipping Label - 8 ½” x 11” Paper - PM Padded Flat Rate Envelope



  Background:
    Given I am signed in as a postage shipper


  @wp_shipping_label_regression
  @wp_shipping_label_8x11_pm_pfr_envelope
  Scenario: Shipping Label - 8 ½” x 11” Paper - PM Padded Flat Rate Envelope

    Then Mail: Select Shipping Label 8 x 11

    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select Service Priority Mail Padded Flat Rate Envelope
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail Print Modal: Select Printer "factory"
    Then Mail Print Modal: Print
    Then Sign out