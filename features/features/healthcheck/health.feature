
Feature: Health Check

  Background:
    Given I launch browser default

  @healthcheck
  Scenario: Healthcheck for Orders & Web Postage
    Then Health Check: Verify Server Health
