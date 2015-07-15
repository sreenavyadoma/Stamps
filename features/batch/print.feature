@regression
Feature: B-01625  As a batch shipper, I want to be able to print sample postage

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01625, Print Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Print
    * Add new order
    * Expect new Order ID created
    * Set Recipient Complete Address to B-01625, Print First-Class Mail Large Envelope/Flat, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to First-Class Mail Large Envelope/Flat
    * Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01625, Print Priority Mail Flat Rate Envelope, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Flat Rate Envelope
    * Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01625, Print Priority Mail Regional Rate Box A, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Regional Rate Box A
    * Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01625, Print Priority Mail Express Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Express Package
    * Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01625, Print Priority Mail Express Flat Rate Envelope, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Print
    * Set Service to Media Mail Package
    * Print
