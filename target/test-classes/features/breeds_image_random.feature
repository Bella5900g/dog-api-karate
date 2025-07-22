Feature: Imagem aleatória de qualquer raça
  Verifica o endpoint GET /breeds/image/random

  Scenario: Buscar imagem aleatória com sucesso
    Given url 'https://dog.ceo/api/breeds/image/random'
    When method get
    Then status 200
    And match response.status == 'success'
    And match response.message == '#regex ^https://images\\.dog\\.ceo/breeds/.+\\.jpg$'

  Scenario: Endpoint inválido retorna 404
    Given url 'https://dog.ceo/api/breeds/image/aleatoria'
    When method get
    Then status 404 