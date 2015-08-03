@regression
Feature:  B-01630 Ship Date - Print 3 days from today

  Background:
    * I am signed in as a batch shipper

  @print_date_picker_today @ship_date
  Scenario:  Print 3 days from today
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date Picker to today
    * Expect Print Window Ship Date to be today
    * Print
