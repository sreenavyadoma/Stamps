Feature:  Mail Contacts

  Background:
    Given Start test driver

  @reference_number_from_contacts_list
  Scenario: WEBAPPS-10781 Reference # field (Use Reference # from Contact List)
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    Then set print form reference number asdf
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then expect search contacts filter panel all contacts count is > 1
    Then expect search contacts filter panel selected count is 0
    Then check search contacts grid name Person 1
    Then expect search contacts filter panel selected count is 1
    Then check search contacts grid name Person 2
    Then expect search contacts filter panel selected count is 2
    Then expect select button count on search contacts toolbar is 2
    # Filter panel
    Then click selected tab on search contacts modal

    Then click select button on search contacts modal

    Then expect selected contacts count is 2
    Then expect multiple contacts view include Person 1, Person 2

    Then expect use reference # from contact list on print form is present
    Then expect use reference # from contact list on print form is unchecked
    Then check use reference # from contact list on print form
    Then expect use reference # from contact list on print form is checked
    Then uncheck use reference # from contact list on print form
    Then expect use reference # from contact list on print form is unchecked
    Then check use reference # from contact list on print form
    Then expect use reference # from contact list on print form is checked
    Then expect placeholder for disabled reference # on print form is Use Reference # from Contact List

    Then expect advanced options cost code field is present
    Then set print form advanced options cost code None

    Then expect use cost code from contact list on print form is present
    Then expect use cost code from contact list on print form is unchecked
    Then check use cost code from contact list on print form
    Then expect use cost code from contact list on print form is checked
    Then uncheck use cost code from contact list on print form
    Then expect use cost code from contact list on print form is unchecked
    Then check use cost code from contact list on print form
    Then expect use cost code from contact list on print form is checked
    Then expect placeholder for disabled cost code on print form is Use Cost Code from Contact List

  @display_rates_for_multiple_contacts
  Scenario: WEBAPPS-10776 Display rates when multiple contacts have been selected
  WEBAPPS-11681 COD Cost appears as $0.00 for all amounts
  WEBAPPS-11680 Insurance Cost appears as $0.00 for all amounts
  PRE-REQUISITE: Account used to sign-in must have Person 1 and Person 2 on contacts list.
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then click mail-to link on print form
    Then expect search contacts modal is present
    Then expect search contacts filter panel all contacts count is > 1
    Then expect search contacts filter panel selected count is 0
    Then check search contacts grid row 0
    Then expect search contacts filter panel selected count is 1
    Then check search contacts grid row 1
    Then expect search contacts filter panel selected count is 2
    Then expect select button count on search contacts toolbar is 2
    Then click selected tab on search contacts modal
    Then click select button on search contacts modal
    Then expect selected contacts count is 2
    Then set print form ounces to 1
    Then select print form service PM Package
    Then show advanced options
    Then open extra services
    Then set extra services cod to 500.00
    Then increment extra services cod by 1
    Then decrement extra services cod by 1
    Then expect extra services cod price is greater than $16.00
    Then close extra services
    Then set print form insure for to $500
    Then expect print form insure-for cost is greater than $6
    Then sign out

