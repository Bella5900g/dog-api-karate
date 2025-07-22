Feature: GET /breeds/image/random

  Scenario: Validar imagem aleatória
    Given url baseUrl + '/breeds/image/random'
    When method GET
    Then status 200
    And match response.status == 'success'
    And match response.message == /^https?:\/\/.*\.(jpg|jpeg|png)$/
