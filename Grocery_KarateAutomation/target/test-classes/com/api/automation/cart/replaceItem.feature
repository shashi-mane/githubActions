Feature: To replace item to cart in application
  Use PUT /carts/:cartId/items/:itemId

  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/cartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * def item_path = 'C:/Users/ShashikantMane/eclipse-workspace/Grocery_KarateAutomation/target/itemId.txt'
    * def item_file = new File(item_path)
    * def scanner = new Scanner(item_file)
    * def itemId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario Outline: Replace item from the cart
    Given path 'carts/'+ cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request {"productId":<productId>,"quantity":<quantity>}
    When method put
    And status 204
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | productId | quantity |
      |      1225 |        3 |

  Scenario Outline: Replace item from the cart with invalid parameter
    Given path 'carts/'+ cartId + '/items/' + itemId
    And header Accept = 'application/json'
    And request {"productId":<productId>,"quantity":<quantity>}
    When method put
    And status 400
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | productId | quantity |
      |     31225 |       30 |

  Scenario Outline: Replace item from the cart with invalid itemId
    Given path 'carts/'+ cartId + '/items/' + itemId + '123'
    And header Accept = 'application/json'
    And request {"productId":<productId>,"quantity":<quantity>}
    When method put
    And status 404
    * print response
    And call read("classpath:com/api/automation/cart/getCartItems.feature")

    Examples: 
      | productId | quantity |
      |      1225 |        3 |
