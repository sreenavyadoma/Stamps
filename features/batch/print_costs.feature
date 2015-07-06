@printing_costs
Feature:
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario:  Print - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631 Total Costs, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Expect order-grid Recipient Name to be B-01625 Print Sample
    * Expect order-grid Company Name to be Priority Mail Package
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Print
    * Sign out