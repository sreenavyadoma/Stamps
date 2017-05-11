Feature: Registration
  Background:
#    Given I loaded SDC Website

  @registration
  Scenario:
#    Then click on Get Started
#
#    # Profile Page
#    Then set Profile page Email to random value
#    Then set Profile page Username to random value
#    Then set Membership page Company to random value
#    Then set Profile page Password to random value
#    Then set Profile page Re-type password to same as previous password
#    Then set Profile page Survey Question to Individual
#    Then set Profile page Promo Code to PR33-NH77
#    Then expect profile page promo code is PR33-NH77
#    Then continue to Membership page
#
#    # Membership Page
#    Then set Membership page member address to random address between zone 1 and 4
#    Then set Membership page Phone to random value
#    Then set Membership page Cardholder's Name to random value
#    Then set Membership page Credit Card Number to default value
#    Then set Membership page Month to Dec (12)
#    Then set Membership page Year to 2026
#    Then check Membership page Terms & Conditions
#
#    Then submit Membership Page

    Then save username to default parameter file
    Then save password to default parameter file
    Then store username to default data store file
    Then send username to standard out
    Then load username and password from default parameter file

    Then save username to parameter file registration_ach_purchase_100k
    Then save password to parameter file registration_ach_purchase_100k
    Then store username to data store file registration_ach_purchase_100k
    Then send username to standard out
    Then load username and password from parameter file registration_ach_purchase_100k

