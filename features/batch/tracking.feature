
Feature: B-01625  As a batch shipper, I want to be able to print sample postage

  Background:
    Given I am signed in as a batch shipper

  @print_first_class_mail_envelope
  Scenario:  Print - First-Class Mail Envelope
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to First-Class Mail Envelope
    * Set tracking to USPS Tracking