Feature: Address Cleansing BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”
    Then on Print form, set Mail From to default
    Then on Print form, set Ship-To country to United States
    Then on Print form, set Ship-To to
      | name              | company | street_address      | city          | state | zip    | country       |
      | Address Cleansing | BVT     | 1350 Market Street  | San Francisco | CA    |        | United States |
    Then on Print form, set Pounds to 0
    Then on Print form, set Ounces to 1
    Then on Shipping Label Print form, set service to Priority Mail Package
    Then on Shipping Label Print form, Expect Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102
    Then Sign out