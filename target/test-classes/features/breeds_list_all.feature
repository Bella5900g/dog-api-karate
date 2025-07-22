Feature: Listar todas as raças de cachorro
  Verifica o endpoint GET /breeds/list/all

  Scenario: Listar todas as raças com sucesso
    Given url 'https://dog.ceo/api/breeds/list/all'
    When method get
    Then status 200
    And match response.status == 'success'
    And match response.message == '#object'
    And match response.message.hound == '#[]'
    And match response.message.bulldog == '#[]'
    And match response.message.retriever == '#[]'

  Scenario: Endpoint inválido retorna 404
    Given url 'https://dog.ceo/api/breeds/list/invalid'
    When method get
    Then status 404 