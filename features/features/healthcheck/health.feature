
Feature: Health Check

  Background:
    Given I launched default browser

  @healthcheck
  Scenario: Healthcheck for Orders & Web Postage
    Then Health Check: Print - Web Batch
    Then Health Check: Print - Address Book
    Then Health Check: OR - Reports
    Then Health Check: OR - Postage Tools