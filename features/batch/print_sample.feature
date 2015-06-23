@regression
Feature: B-01625 As a batch shipper, I want to be able to print sample postage

  Background:
    Given I am signed in as a batch shipper

  Scenario:  User Views Price Next to Service Dropdown
    * Add a new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00

    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button

    * Set Pounds to 1
    * Set Ounces to 1
    * Set Length to 1
    * Set Width to 1
    * Set Height to 1
    * Set Insured Value to 1.00

    * Set Service to Priority Mail Package

    * Expect Order Grid Recipient Name to be B-01671
    * Expect Order Grid Company Name to be Inline Rates
    * Expect Order Grid Street Address to be 1900 E Grand Ave
    * Expect Order Grid City to be El Segundo
    * Expect State to be CA
    * Expect Zip to be 90245
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect Pounds to be 1
    * Expect Ounces to be 1
    * Expect Weight to be 1 lbs. 1 oz.
    * Expect Insured Value to be 1.00
    * Sign out
