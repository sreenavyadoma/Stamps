@regression
Feature: B-01633 Change the starting label position I will print from - Print Left Side

  Background:
    Given I am signed in as a batch shipper

  @print_labels
  Scenario:  B-01633 - Print Left & Right Side
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Service to Priority Mail Package
    And I Open Print Modal
    And Select left side label
    Then Expect left side label selected
    And I Click Print Window - Print button
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Service to Priority Mail Package
    And I Open Print Modal
    Then Expect left side label selected
    And I Click Print Window - Print button

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Service to Priority Mail Package
    And I Open Print Modal
    And Select right side label
    Then Expect right side label selected
    And I Click Print Window - Print button
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Service to Priority Mail Package
    And I Open Print Modal
    Then Expect right side label selected
    And I Click Print Window - Print button

    And Sign out
