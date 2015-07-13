@regression
Feature: B-01625  As a batch shipper, I want to be able to print sample postage

  Background:
    Given I am signed in as a batch shipper auto20/password1

  @print
  Scenario:  Print
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625, Printing Test, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Print
    * Edit row 1 in the order grid
    * Set Service to First-Class Mail Large Envelope/Flat
    * Print
    * Edit row 1 in the order grid
    * Set Service to Priority Mail Flat Rate Envelope
    * Print
    * Edit row 1 in the order grid
    * Set Service to Priority Mail Regional Rate Box A
    * Print
    * Edit row 1 in the order grid
    * Set Service to Priority Mail Express Package
    * Print
    * Edit row 1 in the order grid
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Print
    * Edit row 1 in the order grid
    * Set Service to Media Mail Package
    * Print
