Feature: I want to be able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given I am signed in as a Batch shipper

  Scenario: User can select a new option in the Print Postage On combobox: Shipping Label: 5.5 x 8.5
    When Select to print
    Then Expect you will find new option:  Shipping Label 5.5 x 8.5

  Scenario: User can select this new option by searching in the combobox or selecting it via the combobox menu.
    When Select to print
    Then Expect to be able to select this new option (Shipping Label: 5.5 x 8.5) by searching in the combobox or selecting it via the combobox menu

  Scenario: Tooltip for Shipping Label 5.5 x 8.5
    When Select to print
    And Find Shipping Label 5.5 x 8.5 and hover over
    Then Expect when hover over label tooltip shows same as in WC 2.0

  Scenario: Able to save print setting for 5.5 x 8.5 labels
    When Select to print settings
    And Find 5.5 x 8.5 labels to select for printing
    When Click save button
    Then Expect that prints will now use Shipping label 5.5 x 8.5 layout

  Scenario: Shipping Label 5.5 x 8.5  layout is printed
    When Printing a label
    And Select to Print 5.5 x 8.5 label
    When Click print
    Then Expect a  5.5 x 8.5 label layout to be printed

  Scenario: Able to print single Shipping Label 5.5 x 8.5 label
    When Select to print single label
    And Find 5.5 x 8.5 labels to select for printing
    When Click print
    Then Expect single label printed on Shipping label 5.5 x 8.5 layout

  Scenario: When select to print multiple Shipping Label 5.5 x 8.5 labels, only one Sample printed
    When Select to print multiple labels
    And Find 5.5 x 8.5 labels to select for printing
    When Click print
    Then Expect all labels printed on Shipping label 5.5 x 8.5 layout
    Then Expect system will only print first order

  Scenario: No errors shown when print Shipping Label 5.5 x 8.5
    When Printing a label
    And Select to Print Sample of 5.5 x 8.5 label
    When Click print
    Then Expect to print with out issues (verify logs too)

  Scenario:  User prints postage for domestic, CN22 and CP72
    When Printing a label
    And Select to Print Sample of 5.5 x 8.5 label
    When Click print
    Then Expect to be able to print for Domestic, CN22,CP72


