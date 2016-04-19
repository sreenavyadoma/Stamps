Feature: Volusion New Customer
  Background:
    Given Volusion: Visit Page

  @volusion_new_customer
  Scenario: Volusion New Customer
    Then Volusion Login:  New Customers - Continue
    Then Volusion New to Postage Stamps: Set email address to random
    Then Volusion New to Postage Stamps: Type email address again
    Then Volusion New to Postage Stamps: Set new password to pass111
    Then Volusion New to Postage Stamps: Type new password again
    Then Volusion New to Postage Stamps: Uncheck receive newsletter
    Then Volusion New to Postage Stamps: Check receive newsletter
    Then Volusion New to Postage Stamps: Uncheck receive newsletter
    Then Volusion New to Postage Stamps: Click Continue

    Then Volusion Shipping Address: Set First Name to random
    Then Volusion Shipping Address: Set Last Name to random
    Then Volusion Shipping Address: Set Company to random
    Then Volusion Shipping Address: Set Address 1 to 1990 E Grand Avenue
    Then Volusion Shipping Address: Set City to El Segundo
    Then Volusion Shipping Address: Set Country to United States
    Then Volusion Shipping Address: Set State to California
    Then Volusion Shipping Address: Set Zip Code to 90245
    Then Volusion Shipping Address: Set Phone Number to random
    Then Volusion Shipping Address: Type of address - residential
    Then Volusion Shipping Address: Type of address - Yes
    Then Volusion Shipping Address: Click Continue

    Then Volusion Account: Click My Account
    Then Volusion Account: Click CATEGORY ONE
    Then Volusion Category One: Click SAMPLE PRODUCT ONE
    Then Volusion Product: Set Quantity to 1
    Then Volusion Product: Click ADD TO BAG
    Then Volusion Product: Visit Cart
    Then Volusion Cart: Proceed to checkout
    Then Volusion Checkout: Select My Saved Billing Address 1990 E Grand Avenue, CA
    Then Volusion Checkout: Select Shipping Method - USPS Priority Mail Flat Rate Envelope
    Then Volusion Checkout: Select Payment Method - Cash
    Then Volusion Checkout: Place Order

    Then Volusion Account: Click My Account
    Then Volusion Account: Sign out

    Then Volusion Login:  Set Email Address to qaclient@stamps.com
    Then Volusion Login:  Set Password to pass111




