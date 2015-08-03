@regression
Feature:  B-01630 Ship Date - Print 3 days from today

  Background:
    * I am signed in as a batch shipper

  @print_date_1 @print_date
  Scenario:  Print 3 days from today
    * Add new order
    * Set Ship-To address to B-01630, Print 3 days from today, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date to 1 day from today
    * Print
