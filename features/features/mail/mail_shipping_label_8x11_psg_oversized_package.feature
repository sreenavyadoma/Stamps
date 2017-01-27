Feature: Mail Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package



  Background:
    Given I am signed in as Mail shipper


  @mail_print_shipping_label_8x11_psg_oversized_package
  Scenario: Shipping Label - 8 ½” x 11” Paper - PSG Oversized Package

    Then Mail: Select Shipping Label - 8 ½” x 11” Paper

    Then Mail: Set Mail From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Select service Parcel Select Ground Oversized Package
    Then Mail Shipping Labels: Select left side starting label
    Then Mail: Open Print Modal
    Then Mail in Print modal, select Printer "factory"
    Then Mail in Print modal, click Print button
    Then Sign out