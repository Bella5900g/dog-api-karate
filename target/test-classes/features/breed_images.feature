Feature: Listar imagens de uma raça
  Verifica o endpoint GET /breed/{breed}/images

  Scenario Outline: Listar imagens de uma raça válida
    Given url 'https://dog.ceo/api/breed/' + breed + '/images'
    When method get
    Then status 200
    And match response.status == 'success'
    And match response.message == '#array'
    And match each response.message == '#regex ^https://images\\.dog\\.ceo/breeds/.+\\.jpg$'

    Examples:
      | breed      |
      | hound      |
      | bulldog    |
      | retriever  |

  Scenario: Raça inválida retorna 404
    Given url 'https://dog.ceo/api/breed/invalid/images'
    When method get
    Then status 404 

  Scenario: Listar imagens de uma sub-raça válida
    Given url 'https://dog.ceo/api/breed/bulldog/boston/images'
    When method get
    Then status 200
    And match response.status == 'success'
    And match response.message == '#array'
    And match each response.message == '#regex ^https://images\\.dog\\.ceo/breeds/.+\\.jpg$'

  Scenario: Método POST não permitido
    Given url 'https://dog.ceo/api/breed/hound/images'
    When method post
    Then status 405

  Scenario: Método PUT não permitido
    Given url 'https://dog.ceo/api/breed/hound/images'
    When method put
    Then status 405

  Scenario: Método DELETE não permitido
    Given url 'https://dog.ceo/api/breed/hound/images'
    When method delete
    Then status 405 

  Scenario Outline: Listar imagens de várias raças dinamicamente
    Given url 'https://dog.ceo/api/breed/<breed>/images'
    When method get
    Then status 200
    And match response.status == 'success'
    And match response.message == '#array'
    And match each response.message == '#regex ^https://images\\.dog\\.ceo/breeds/.+\\.jpg$'

    Examples:
      | breed      |
      | hound      |
      | bulldog    |
      | retriever  |
      | pug        |
      | beagle     |
      | boxer      | 