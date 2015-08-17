@regression
Feature: B-01633 Change the starting label position I will print from - Print Left Side

  Background:
    * I am signed in as a batch shipper

  @print_labels
  Scenario:  B-01633 - Print Left Side
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Service to Priority Mail Package
    * Open Print Modal
    * Select left side label
    * Expect left side label selected
    * Click Print Window - Print button
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Service to Priority Mail Package
    * Open Print Modal
    * Expect left side label selected
    * Click Print Window - Print button
    * Sign out

  @print_label_right_side @print_labels
  Scenario:  B-01633 - Print on Right Side
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Service to Priority Mail Package
    * Open Print Modal
    * Select right side label
    * Expect right side label selected
    * Click Print Window - Print button
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Service to Priority Mail Package
    * Open Print Modal
    * Expect right side label selected
    * Click Print Window - Print button
    * Sign out
