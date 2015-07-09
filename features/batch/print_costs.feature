@print_costs
Feature: Printing Cost Tests

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631, I want to be able to see the total cost of my print job before I print, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Tracking to be None
    * Expect Service Cost to be $0.98
    * Expect Insured Value to be $10.00
    * Expect Insurance Cost to be $2.20
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $3.18
    * Expect Ship Cost to be $3.18
    * Expect Print Window Total Cost to be $3.18
    * Sign out

  Scenario: B-01726 Update Postage Balance After Each Print
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to B-01726, Update Postage Balance After Each Print, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Tracking to be None
    * Expect Service Cost to be $0.98
    * Expect Insured Value to be $10.00
    * Expect Insurance Cost to be $2.20
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $3.18
    * Expect Ship Cost to be $3.18
    * Expect Print Window Total Cost to be $3.18
    * Sign out
    * Sign out

  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to B-01743, Show Cost of Order in Ship Cost Grid, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Tracking to be None
    * Expect Service Cost to be $0.98
    * Expect Insured Value to be $10.00
    * Expect Insurance Cost to be $2.20
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $3.18
    * Expect Ship Cost to be $3.18
    * Expect Print Window Total Cost to be $3.18
    * Sign out
