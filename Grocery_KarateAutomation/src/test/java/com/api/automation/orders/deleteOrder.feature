Feature: To delete an order created by the API client.
  use DELETE /orders/:orderId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def token_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/accessToken.txt'
    * def token_file = new File(token_path)
    * def scanner = new Scanner(token_file)
    * def accessToken = scanner.useDelimiter('\\Z').next()
    * def orderId_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/orderId.txt'
    * def orderId_file = new File(orderId_path)
    * def scanner = new Scanner(orderId_file)
    * def orderId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario: To delete an order created by the API client => Unauthorized
    Given path '/orders/' + orderId
    And header Authorization = 'Bearer ' + accessToken + 'abc'
    When method delete
    Then status 401
    And print response

  Scenario: To delete an order created by the API client with invalid orderId
    Given path '/orders/' + orderId + 'abc'
    And header Authorization = 'Bearer ' + accessToken
    When method delete
    Then status 404
    And print response

  Scenario: To delete an order created by the API client
    Given path '/orders/' + orderId
    And header Authorization = 'Bearer ' + accessToken
    When method delete
    Then status 204
    And print response
