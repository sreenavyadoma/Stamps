Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper with credentials auto01/password1

  Scenario:  User Views Price Next to Service Dropdown
    * Add new order
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

    * Expect order-grid Recipient Name to be B-01671
    * Expect order-grid Company Name to be Inline Rates
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect Zip to be 90245
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect order-grid Pounds to be 1
    * Expect order-grid Ounces to be 1
    * Expect Weight to be 1 lbs. 1 oz.
    * Expect Insured Value to be 1.00
    * Sign out
