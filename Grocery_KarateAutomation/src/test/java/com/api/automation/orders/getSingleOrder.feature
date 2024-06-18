Feature: To test the single order created by the API client.
  use GET /orders/:orderId

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

  Scenario: To get the single order created by api client
    Given path '/orders/' + orderId
    And param invoice = true
    And header Authorization = 'Bearer ' + accessToken
    When method get
    Then status 200
    And print response
    
    Scenario: To get the single order created by api client with invalid orderId
    Given path '/orders/' + orderId + '123'
    And param invoice = true
    And header Authorization = 'Bearer ' + accessToken
    When method get
    Then status 404
    And print response

  Scenario Outline: To get the single order created by api client => Unauthorized
    Given path '/orders/' + orderId
    And param invoice = true
    And header Authorization = 'Bearer ' + '<invalidAccessToken>'
    When method get
    Then status 401
    And print response

    Examples: 
      | invalidAccessToken                                               |
      | beff20404a47f23c9ca61f576a0cfa49d9febdb228a409c2f7630cd724288ab3 |
