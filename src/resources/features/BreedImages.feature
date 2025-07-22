Feature: GET /breed/{breed}/images

  Scenario Outline: Validar imagens da raça <breed>
    Given url baseUrl + '/breed/' + breed + '/images'
    When method GET
    Then status 200
    And match response.status == 'success'
    And match each response.message contains 'http'
    And match each response.message[*] == /^https?:\/\/.*\.(jpg|jpeg|png)$/

    Examples:
      | breed     |
      | bulldog   |
      | retriever |
      | hound     |

  Scenario: Raça inválida
    Given url baseUrl + '/breed/raça-invalida/images'
    When method GET
    Then status 404
