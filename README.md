# Dog API - Testes Automatizados com Karate DSL

Projeto completo de automação de testes de API utilizando [Karate DSL](https://github.com/karatelabs/karate) para validar a [Dog API](https://dog.ceo/dog-api/documentation).

---

## 🚀 Passo a passo para rodar os testes

### 1. Pré-requisitos
- **Java 11+** instalado ([download](https://adoptium.net/))
- **Maven 3.6+** instalado ([download](https://maven.apache.org/download.cgi))
- Acesso à internet (para baixar dependências e acessar a API)

### 2. Clonar o projeto
```bash
# Clone o repositório
 git clone <URL_DO_REPOSITORIO>
 cd dog-api-karate
```

### 3. Executar os testes
```bash
# Instalar dependências e rodar todos os testes
mvn clean test
```

### 4. Acessar o relatório HTML dos testes
Após a execução, abra o arquivo:
```
target/karate-reports/karate-summary.html
```
Basta abrir esse arquivo no navegador para visualizar o resultado detalhado de todos os cenários.

---

## 🗂️ Estrutura do Projeto
```
src
└── test
    ├── java
    │   └── runner
    │        └── DogApiRunner.java         # Runner JUnit5 para execução dos testes
    └── resources
        ├── features                      # Arquivos .feature com os cenários de teste em Gherkin
        │     ├── breeds_list_all.feature      # Testes do endpoint de listagem de raças
        │     ├── breed_images.feature         # Testes do endpoint de imagens por raça/sub-raça
        │     └── breeds_image_random.feature  # Testes do endpoint de imagem aleatória
        ├── data                          # Dados de teste externos (ex: breeds.json)
        └── karate-config.js              # Configurações globais e funções utilitárias
```

---

## 🧪 O que está sendo testado

### Endpoints cobertos:
- **GET /breeds/list/all**
- **GET /breed/{breed}/images**
- **GET /breed/{breed}/{sub-breed}/images**
- **GET /breeds/image/random**

### Cenários de Teste:
- Listagem de todas as raças (sucesso e endpoint inválido)
- Listagem de imagens de raças e sub-raças (sucesso, raça inválida)
- Busca de imagem aleatória (sucesso, endpoint inválido)
- Testes dinâmicos para múltiplas raças (dados externos)
- Testes de métodos HTTP não permitidos (POST, PUT, DELETE)

### Validações realizadas:
- **Status HTTP:** 200, 404, 405
- **Estrutura do JSON:** campos obrigatórios, tipos corretos
- **Formato das URLs de imagem:** regex para garantir padrão correto
- **Presença de raças e sub-raças conhecidas**
- **Cenários negativos:** endpoints e raças inválidas

---

## 📊 Relatórios de Teste
- Após rodar `mvn clean test`, o relatório HTML é gerado automaticamente em:
  - `target/karate-reports/karate-summary.html`
- Basta abrir esse arquivo no navegador para ver o status de cada cenário, detalhes das requisições e respostas, e evidências de falha (se houver).

---

## ⚙️ Integração Contínua (CI)
- Exemplo de pipeline pronto em `.github/workflows/karate.yml` para rodar os testes automaticamente no GitHub Actions.
- Badge de status do build:

![Build Status](https://github.com/<USUARIO>/<REPO>/actions/workflows/karate.yml/badge.svg)

---

## 📚 Dicas e Customizações
- Para adicionar novas raças nos testes dinâmicos, edite o arquivo `src/test/resources/data/breeds.json`.
- Para criar novos cenários, adicione arquivos `.feature` em `src/test/resources/features`.
- Funções utilitárias podem ser adicionadas em `karate-config.js`.

---