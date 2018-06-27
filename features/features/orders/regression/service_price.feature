
Feature: User Views Price Next to service Dropdown

  Background:
    Given a valid user is signed in to Web Apps

  @inline_service_rates
  Scenario:  User Views Price Next to service Dropdown
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then expect order details service cost is 0.00
    Then expect Order Details Service Cost inline price for "FCM Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "First-Class Mail Package/Thick Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Large/Thick Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "PM Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Large Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Small Flat Rate Box" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Medium Flat Rate Box" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Large Flat Rate Box" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box A" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box B" is greater than $0.01
    Then expect Order Details Service Cost inline price for "PME Package/Flat/Thick Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "PME Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "PME Legal Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "PME Padded Flat Rate Envelope" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Parcel Select Ground Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Parcel Select Ground Large Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Parcel Select Ground Oversized Package" is greater than $0.01
    Then expect Order Details Service Cost inline price for "Media Mail Package" is greater than $0.01
    #Then expect orders grid pounds is 0
    #Then expect orders grid ounces is 0
    #Then expect orders grid weight is 0 lb. 0 oz.
    Then sign out
