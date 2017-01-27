
Feature: User Views Price Next to service Dropdown

  Background:
    Given a valid user is signed in to Web Apps

  @inline_service_rates
  Scenario:  User Views Price Next to service Dropdown
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, expect service Cost is $0.00
    Then On Order Details form, expect service Cost inline price for "FCM Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "First-Class Mail Package/Thick Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Large/Thick Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "PM Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Large Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Padded Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Legal Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Small Flat Rate Box" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Medium Flat Rate Box" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Large Flat Rate Box" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Regional Rate Box A" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Regional Rate Box B" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Express Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Express Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Parcel Select Ground Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Parcel Select Ground Large Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Parcel Select Ground Oversized Package" is greater than $0.01
    Then On Order Details form, expect service Cost inline price for "Media Mail Package" is greater than $0.01
    Then In Orders Grid, expect Pounds is 0
    Then In Orders Grid, expect Ounces is 0
    Then In Orders Grid, expect Weight is 0 lb. 0 oz.
    Then Sign out
