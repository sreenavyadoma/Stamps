@regression
Feature: B-01633 Change the starting label position I will print from - Print Left Side

  @print_label_left_side @print_labels
  Scenario:  B-01633 - Print Left Side
    * I am signed in as a batch shipper
    * Add new order
    * Set Recipient Address to B-01633, Print Left Side, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to 415-795-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Open Print Window
    * Expect default print label to be Left side
    * Select left side label
    * Click Print Window - Print button
    * Sign out
