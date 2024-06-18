Feature: To create new order in application
  Use POST /orders

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * def token_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/accessToken.txt'
    * def token_file = new File(token_path)
    * def scanner = new Scanner(token_file)
    * def accessToken = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario Outline: Create new order in application with invalid parameters
    Given path '/orders'
    * def cartId = cartId + 'abc'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + accessToken
    When method post
    Then status 400
    And print response

    Examples: 
      | customerName |
      | "Joe Smith"  |

  Scenario Outline: Create new order in application => Unauthorized
    Given path '/orders'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + '<invalidAccessToken>'
    When method post
    Then status 401
    And print response

    Examples: 
      | customerName | invalidAccessToken                                               |
      | "Joe Smith"  | beff20404a47f23c9ca61f576a0cfa49d9febdb228a409c2f7630cd724288ab3 |

  Scenario Outline: Create new order in application
    Given path '/orders'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + accessToken
    When method post
    Then status 201
    And match response.created == true
    And print response
    * def orderId = response.orderId
    And print "orderId: ",orderId
    * eval karate.write(orderId,"orderId.txt")

    Examples: 
      | customerName |
      | "Joe Smith"  |
