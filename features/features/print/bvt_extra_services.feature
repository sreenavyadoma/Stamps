Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_extra_services
  Scenario: Extra Services

    Then Print Postage: Select Shipping Label 5 x 8

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Set Hide Postage Value to Unchecked

    Then Shipping Labels: Open Extra Services
    Then Extra Services: Set Security to Registered Mail
    Then Extra Services: Set Security Value to $100
    Then Extra Services: Set Return Receipt to Checked
    Then Extra Services: Set COD to $20
    Then Extra Services: Set Handling to Normal
    Then Extra Services: Set Non-Rectangular to Checked
    Then Extra Services: Click Save
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_shipping_label_right_panel
  Scenario: Shipping Label Right Panel

    Then Print Postage: Select Shipping Label 5 x 8

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Set Hide Postage Value to Unchecked
    Then Shipping Labels: Set Print Receipt to Checked
    Then Shipping Labels: Set Print Reference Number to Checked
    Then Shipping Labels: Set Reference Number to 12345
    Then Shipping Labels: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out
