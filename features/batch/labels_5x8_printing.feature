Feature: I want to be able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given I am signed in as a batch shipper ie/satya/cctest1/password1

  Scenario: User can select a new option in the Print Postage On combobox: Shipping Label - 5.5 x 8.5
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Open Print Modal
    Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
    Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then Click Print Modal - Print button


  Scenario: User can select this new option by searching in the combobox or selecting it via the combobox menu.
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Open Print Modal
    Then Select new option Shipping Label 5.5 x 8.5

  Scenario: Able to save print setting for Shipping Labels 5.5 x 8.5
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Open Print Settings
    Then Select new option "Shipping Label 5.5 x 8.5"
    Then Click Save button
    Then Expect saves settings to "5.5 x 8.5 Shipping Labels"

  Scenario: Shipping Label 5.5 x 8.5 layout is printed
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Open Print Modal
    Then Select new option "Shipping Label 5.5 x 8.5"
    Then Click Print Modal - Print button
    Then Expect a print of Shipping Label 5.5 x 8.5

  Scenario: Print Shipping Label 5.5 x 8.5 Sample
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to Priority Mail Package
    Then Open Print Modal
    Then Select new option Shipping Label 5.5 x 8.5
    Then Print Sample


  Scenario: When select to print multiple Shipping Label 5.5 x 8.5 labels, only one Sample prints
    Then Select to print multiple labels
    Then Open Print Modal
    Then Select Shipping Lable 5.5 x 8.5 labels for printing
    Then Print Sample
    Then Expect system will only print first order


  Scenario:  User prints postage for domestic on Shipping Label 5.5 x 8.5
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Jessie Joe      | The House               | 330 Island  Ave     | Wilmington    | CA    | 90744 | United States |        |        |
    Then Set Service to Priority Mail Package
    Then Open Print Modal
    Then Select option Shipping Label 5.5 x 8.5
    Then Click Print Modal - Print button




  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5


  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
