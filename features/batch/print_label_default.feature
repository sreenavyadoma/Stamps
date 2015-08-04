@regression
Feature: B-01633 Change the starting label position I will print from - Default is Left Side

  Background:
    Given I am signed in as a batch shipper

  @print_label_default @print_labels
  Scenario:  B-01633 - Default is Left Side
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to 415-795-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Expect left side label selected
    * Close Print Window
    * Sign out
