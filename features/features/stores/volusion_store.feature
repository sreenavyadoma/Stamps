
Feature: Volusion New Customer
  Background:
    Given Volusion: Visit Page

  @volusion_new_customer
  Scenario: Volusion New Customer
    Then Volusion New Customers: Click continue
    Then Volusion New to Stamps: Set email address to random
    Then Volusion New to Stamps: Type email address again
    Then Volusion New to Stamps: Set new password to pass111
    Then Volusion New to Stamps: Type new password again
    Then Volusion New to Stamps: Uncheck receive newsletter
    Then Volusion New to Stamps: Check receive newsletter
    Then Volusion New to Stamps: Uncheck receive newsletter
    Then Volusion New to Stamps: Click Continue

    Then Volusion Address: Set First Name to random
    Then Volusion Address: Set Last Name to random
    Then Volusion Address: Set Company to random
    Then Volusion Address: Set Address 1 to 1990 E Grand Avenue
    Then Volusion Address: Set City to El Segundo
    Then Volusion Address: Set Country to United States
    Then Volusion Address: Set State to California
    Then Volusion Address: Set Zip Code to 90245
    Then Volusion Address: Set Phone Number to random
    Then Volusion Address: Type of address - residential
    Then Volusion Address: Type of address - business
    Then Volusion Address: Type of address - Yes
    Then Volusion Address: Type of address - No
    Then Volusion Address: Type of address - Yes
    Then Volusion Address: Click Continue

    Then Volusion Account: Click My Account
    Then Volusion Account: Click CATEGORY ONE
    Then Volusion Category One: Click SAMPLE PRODUCT ONE
    Then Volusion Product: Set Quantity to 1
    Then Volusion Product: Click ADD TO BAG
    Then Volusion Cart: Proceed to checkout
    Then Volusion Checkout: Select My Saved Billing Address 1990 E. Grand Avenue, CA
    Then Volusion Checkout: Place Order



