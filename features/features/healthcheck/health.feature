
Feature: Health Check

  Background:
    Given I launched the default browser

  @healthcheck
  Scenario: Healthcheck for Orders & Web Postage
    Then Health Check: Verify Server Health
