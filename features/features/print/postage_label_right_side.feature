Feature: Postage Shipping Label - Right Side



  Background:
    Given I am signed in as a postage shipper


  @wp_label_right_side
  Scenario: Right Side Shipping Label - 8 ½” x 11” Paper

    Then Print Postage: Select Shipping Label 8 x 11

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select right side starting label
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_label_right_side
  Scenario: Right Side Shipping Label -  5 ½” x 8 ½”

    Then Print Postage: Select Shipping Label 5 x 8

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select right side starting label
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_label_right_side
  Scenario: Right Side Shipping Label -  SDC-1200

    Then Print Postage: Select Shipping Label 4 x 6

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select right side starting label
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out