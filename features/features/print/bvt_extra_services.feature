Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_extra_services
  Scenario: Extra Services

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Select Service Priority Mail Padded Flat Rate Envelope
    Then Postage Shipping Labels: Set Hide Postage Value to Unchecked

    Then Postage Shipping Labels: Open Extra Services
    Then Postage Extra Services: Set Security to Registered Mail
    Then Postage Extra Services: Set Security Value to $100
    Then Postage Extra Services: Set Return Receipt to Checked
    Then Postage Extra Services: Set COD to $20
    Then Postage Extra Services: Set Handling to Normal
    Then Postage Extra Services: Set Non-Rectangular to Checked
    Then Postage Extra Services: Click Save
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then Postage: Select Shipping Label 5 x 8

    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Set Service to "Priority Mail Package"
    Then Postage Shipping Labels: Set Hide Postage Value to Unchecked
    Then Postage Shipping Labels: Set Print Receipt to Checked
    Then Postage Shipping Labels: Set Print Reference Number to Checked
    Then Postage Shipping Labels: Set Reference Number to 12345
    Then Postage Shipping Labels: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out
