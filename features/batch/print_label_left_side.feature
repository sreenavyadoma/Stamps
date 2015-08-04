@regression
Feature: B-01633 Change the starting label position I will print from - Print Left Side

  @print_label_left_side @print_labels
  Scenario:  B-01633 - Print Left Side
    * I am signed in as a batch shipper
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to 415-795-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Select left side label
    * Expect left side label selected
    * Click Print Window - Print button
    * Sign out
