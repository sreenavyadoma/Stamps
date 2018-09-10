Feature:  Mail BVT

  Background:
    Given Start test driver
# Person 1, Company 1
  @mail_bvt_international
  Scenario: International Shipping
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then select from print form mail-to text area list of values Person 1
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then show advanced options

