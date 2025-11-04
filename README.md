# api-rest-ruby

API REST em Ruby on Rails com estrutura CRUD completa.

## Sobre

Esta é uma API REST construída com Ruby on Rails que implementa operações CRUD (Create, Read, Update, Delete) para gerenciar artigos.

## Requisitos

- Ruby 3.2.x
- SQLite3
- Bundler

## Instalação

1. Clone o repositório:
```bash
git clone https://github.com/AugustoArand/api-rest-ruby.git
cd api-rest-ruby
```

2. Instale as dependências:
```bash
bundle install
```

3. Configure o banco de dados:
```bash
rails db:create
rails db:migrate
```

## Uso

### Iniciar o servidor

```bash
rails server
```

O servidor estará disponível em `http://localhost:3000`

### Endpoints da API

#### Listar todos os artigos
```
GET /articles
```

#### Buscar um artigo específico
```
GET /articles/:id
```

#### Criar um novo artigo
```
POST /articles
Content-Type: application/json

{
  "article": {
    "title": "Título do Artigo",
    "content": "Conteúdo do artigo",
    "published": true
  }
}
```

#### Atualizar um artigo
```
PUT /articles/:id
Content-Type: application/json

{
  "article": {
    "title": "Título Atualizado",
    "content": "Conteúdo atualizado"
  }
}
```

#### Deletar um artigo
```
DELETE /articles/:id
```

## Estrutura do Modelo

### Article

- `title` (string, obrigatório, mínimo 3 caracteres)
- `content` (text, obrigatório)
- `published` (boolean, padrão: false)
- `created_at` (datetime)
- `updated_at` (datetime)

## Testes

Execute os testes com:

```bash
rails test
```

## Estrutura do Projeto

```
.
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   └── articles_controller.rb
│   └── models/
│       ├── application_record.rb
│       └── article.rb
├── config/
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── environments/
│   ├── initializers/
│   └── routes.rb
├── db/
│   └── migrate/
│       └── 20231101000000_create_articles.rb
├── test/
│   ├── controllers/
│   │   └── articles_controller_test.rb
│   ├── fixtures/
│   │   └── articles.yml
│   ├── models/
│   │   └── article_test.rb
│   └── test_helper.rb
├── Gemfile
├── Rakefile
└── config.ru
```

## Tecnologias Utilizadas

- Ruby 3.2
- Ruby on Rails 7.0
- SQLite3
- Puma (servidor web)

## Licença

Este projeto está sob licença MIT.