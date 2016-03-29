Feature: Postage Shipping Label - Left Side



  Background:
    Given I am signed in as a postage shipper


  @wp_label_left_side
  Scenario: Left Side Shipping Label - 8 ½” x 11” Paper

    Then Print Postage: Select Print On Shipping Label - 8 ½” x 11” Paper

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select left side starting label
    Then Footer: Print Postage
    Then Sign out

  @wp_label_left_side
  Scenario: Left Side Shipping Label -  5 ½” x 8 ½”

    Then Print Postage: Select Print On Shipping Label - 5 ½” x 8 ½”

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select left side starting label
    Then Footer: Print Postage
    Then Sign out

  @wp_label_left_side
  Scenario: Left Side Shipping Label -  SDC-1200

    Then Print Postage: Select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select left side starting label
    Then Footer: Print Postage
    Then Sign out

