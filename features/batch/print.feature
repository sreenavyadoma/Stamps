@B-01625 @print
Feature: B-01625  As a batch shipper, I want to be able to print sample postage

  Background:
    Given I am signed in as a batch shipper with credentials auto20/password1

  #@print_first_class_mail_envelope
  #Scenario:  Print - First-Class Mail Envelope
  #  * Add new order
  #  * Expect new Order ID created
  #  * Expect Single Order Form - Service Rate to be $0.00
  #  * Set Ship From to default
  #  * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
  #  * Set Phone to (415) 123-5555
  #  * Set Email to rtest@stamps.com
  #  * Click Ship To Less button
  #  * Set Service to First-Class Mail Envelope
  #  * Expect order-grid Recipient Name to be B-01625 Print Sample
  #  * Expect order-grid Company Name to be Priority Mail Package
  #  * Expect order-grid Street Address to be 1900 E Grand Ave
  #  * Expect order-grid City to be El Segundo
  #  * Expect order-grid State to be CA
  #  * Expect order-grid Zip Code to be 90245
  #  * Expect order-grid Phone to be (415) 123-5555
  #  * Expect order-grid Email to be rtest@stamps.com
  #  * Print Sample
  #  * Print
  #  * Sign out

  #@print_first_class_mail_envelope_expecting_an_error
  #Scenario:  Print - First-Class Mail Envelope raises an Error
  #  * Add new order
  #  * Expect new Order ID created
  #  * Expect Single Order Form - Service Rate to be $0.00
  #  * Set Ship From to default
  #  * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
  #  * Set Phone to (415) 123-5555
  #  * Set Email to rtest@stamps.com
  #  * Click Ship To Less button
  #  * Set Service to Priority Mail Package
  #  * Set Pounds to 1
  #  * Set Ounces to 1
  #  * Set Length to 1
  #  * Set Width to 1
  #  * Set Height to 1
  #  * Set Insured Value to 1.00
  #  * Expect order-grid Recipient Name to be B-01625 Print Sample
  #  * Expect order-grid Company Name to be Priority Mail Package
  #  * Expect order-grid Street Address to be 1900 E Grand Ave
  #  * Expect order-grid City to be El Segundo
  #  * Expect order-grid Phone to be (415) 123-5555
  #  * Expect order-grid Email to be rtest@stamps.com
  #  * Expect order-grid Pounds to be 1
  #  * Expect order-grid Ounces to be 1
  #  * Expect order-grid Weight to be 1 lbs. 1 oz.
  #  * Expect order-grid Insured Value to be 1.00
  #  * Print raises a Printing Error
  #  * Print Sample
  #  * Sign out

  @print_priority_mail_package
  Scenario:  Print - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
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
    * Print Sample
    * Print
    * Sign out

  @print_priority_mail_large_flat_rate_box
  Scenario:  Print - Priority Mail Large Flat Rate Box
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Large Flat Rate Box, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Large Flat Rate Box
    * Expect order-grid Recipient Name to be B-01625 Print Sample
    * Expect order-grid Company Name to be Priority Mail Large Flat Rate Box
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Print Sample
    * Print
    * Sign out

  @print_priority_mail_express_package
  Scenario:  Print - Priority Mail Express Package
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Express Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Express Package
    * Expect order-grid Recipient Name to be B-01625 Print Sample
    * Expect order-grid Company Name to be Priority Mail Express Package
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Print Sample
    * Print
    * Sign out

  @print_media_mail_package
  Scenario:  Print - Media Mail Package
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Media Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Media Mail Package
    * Expect order-grid Recipient Name to be B-01625 Print Sample
    * Expect order-grid Company Name to be Media Mail Package
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Print Sample
    * Print
    * Sign out

  @print_parcel_select_package
  Scenario:  Print - Parcel Select Package
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form - Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01625 Print Sample, Parcel Select Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Parcel Select Package
    * Expect order-grid Recipient Name to be B-01625 Print Sample
    * Expect order-grid Company Name to be Parcel Select Package
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 90245
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Print Sample
    * Print
    * Sign out



