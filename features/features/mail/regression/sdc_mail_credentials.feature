#Feature:  Mail Credentials Tests
##
##  Background:
##    Given Start test driver
##
##
##  @authentication
##  Scenario: Mail - Remember Username
##    Then visit Mail
##    Then sign-in to Mail
##    Then set username in Mail
##    Then set password in Mail
##    Then set Remember Username to Checked
##    Then click Sign In in Mail
##    Then sign-out of SDC Website
##    Then visit Mail
##    Then open sign in modal in Mail
##    Then expect username is present in username field
##    Then expect Remember Username is checked
##  te
Feature:  Mail Credentials Tests

  Background:
    Given Start test driver


  @sdc_mail_remember_username
  Scenario: Mail - Remember Username
    Then visit Mail
    Then sign-in to Mail
    Then sign-out of SDC Website

        #Then set username in Mail
    #Then set password in Mail
    #Then set Remember Username to Checked
    #Then click Sign In in Mail
    #Then sign-out of SDC Website
    #Then visit Mail
    #Then open sign in modal in Mail
    #Then expect username is present in username field
    #Then expect Remember Username is checked


  @bvt_new_order


  Scenario:  BVT Add a new order
    Then visit Orders landing page
    Then sign-in to Orders
    Then add new order
    Then set Order Details Ship-To to random address between zone 9
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1
    Then set Order Details Insure-For to $1.00
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
#  # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1
    Then expect Orders Grid Weight is 1 lb. 1 oz.
    Then expect Orders Grid Insured Value is $1.00
    Then sign-out of SDC Website