@bvt
Feature:  Build Verification Test

  Background:
    Given I am signed in as a batch shipper with credentials auto05/password1

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add a new order
    * Expect new Order ID created
    * Add new Ship-From address;
      |ship_from_zip  | name          | company     | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Sign out

  @bvt_address_cleansing
  Scenario: Address Cleansing
    * Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect Zip to be 94102
    * Set Receipient partial address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Set Service to Priority Mail Package
    * Set Ounces to 1
    * Expect Order Grid Recipient Name to be B-01603
    * Expect Order Grid Company Name to be Address Cleansing
    * Expect Order Grid Street Address to be 1390 Market Street Ste 702
    * Expect Order Grid City to be San Francisco
    * Expect State to be CA
    * Expect Zip to be 94102
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect Ounces to be 1
    * Sign out

  @bvt_add_new_order
  Scenario:  Add New Order
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
