Feature: GET /breeds/list/all

  Scenario: Validar lista de todas as raças
    Given url baseUrl + '/breeds/list/all'
    When method GET
    Then status 200
    And match response.status == 'success'
    And match response.message == "#object"
    And match response.message.bulldog == "#array"
