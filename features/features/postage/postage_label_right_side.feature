Feature: Postage Shipping Label - Right Side



  Background:
    Given I am signed in as a postage shipper


  @postage_label_right_side
  Scenario: Extra Services

    Then Print Postage: Select Print On Shipping Label - 8 ½” x 11” Paper

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102  | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"
    Then Shipping Labels: Select right side starting label
    Then Footer: Print Postage
    Then Sign out