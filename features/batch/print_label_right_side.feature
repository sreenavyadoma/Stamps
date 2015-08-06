@regression
Feature: B-01633 Change the starting label position I will print from - Print on Right Side

  Background:
    * I am signed in as a batch shipper

  @print_label_right_side @print_labels
  Scenario:  B-01633 - Print on Right Side
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Select right side label
    * Expect right side label selected
    * Click Print Window - Print button
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Expect right side label selected
    * Click Print Window - Print button
    * Sign out
