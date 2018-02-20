
Feature: Populate all profile page required fields and click continue.

  Background:
    Given I loaded the default registration page

  @create_profile_page_objects
  Scenario: WEBDEVAUTO-187 Create Page Object for registration profile page
    # Then set profile page email to random value
    Then set Profile email to abc@stamps.com
    Then set Profile username to abc
    Then set Profile Password to pass111
    #Then set Profile RE-TYPE Password to pass111

