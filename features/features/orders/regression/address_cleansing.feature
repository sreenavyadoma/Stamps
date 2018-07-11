
Feature: Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @address_cleansing
  Scenario: Address Cleansing
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name              | company | street_address1   | street_address2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then set order details pounds to 1
    Then pause for 2 seconds
    #Then expect orders grid zip is 90245
    #Then expect orders grid recipient is Address Cleansing
    #Then expect orders grid company is No Zip
    #Then expect orders grid city is El Segundo
    #Then expect orders grid state is CA

    Then add new order
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then sign out