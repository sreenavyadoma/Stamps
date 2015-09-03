@regression
Feature: I want Batch and Print Postage to use the same design conventions] B-01682
    Open Style Guide: http://sdcintranet/ProductAndServiceOperations/ProductManagement/Product%20Management%20Documents/Web%20Client/Style%20Guide/Web%20Client%20Style%20Guide.docx

  Background:
    Given I am signed in as a batch shipper

    @styles
  Scenario: Font and tool tips
    Then Right-click on page and inspect element

