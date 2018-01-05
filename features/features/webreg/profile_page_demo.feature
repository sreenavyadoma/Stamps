
Feature: Populate all profile page required fields and click continue.

  Background:
    Given I launched default browser

  @create_profile_page_objects
  Scenario: WEBDEVAUTO-187 Create Page Object for registration profile page
    Then set Profile email to rctest@stamps.com
    #Then expect Profile email is rctest@stamps.com
    Then Set profile email to blah@blah.com
    Then set Profile username to rcruz
    Then set Profile Password to pass111

    Then set profile page email to rctest@stamps.com

    Then set profile page email to random value
