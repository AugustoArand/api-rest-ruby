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

**Nota:** Este projeto requer o uso de `bundle exec` antes dos comandos Rails/Rake para garantir que as versões corretas das gems sejam utilizadas.

3. Configure o banco de dados:
```bash
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed  # Opcional: carrega dados de exemplo
```

## Uso

### Iniciar o servidor

```bash
bundle exec rackup
```

O servidor estará disponível em `http://localhost:9292`

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

Ou execute testes específicos:

```bash
ruby -I test test/models/article_test.rb
ruby -I test test/controllers/articles_controller_test.rb
```

## Script de Exemplo

Há um script de exemplo (`example_usage.rb`) que demonstra todas as operações CRUD:

```bash
# Primeiro, inicie o servidor em um terminal
rails server

# Em outro terminal, execute o script de exemplo
ruby example_usage.rb
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
- Ruby on Rails 7.2
- SQLite3
- Puma (servidor web)

## Persistência de Dados

💾 **Os dados são salvos permanentemente!** 

Todos os artigos criados via POST ficam armazenados no arquivo `db/development.sqlite3` e **não são perdidos** quando a aplicação é fechada. SQLite é um banco de dados real que persiste os dados no disco.

## Segurança

⚠️ **Nota Importante**: A configuração CORS atual permite acesso de qualquer origem (`*`). Para uso em produção:

1. Defina origens específicas permitidas no arquivo `config/initializers/cors.rb`
2. Ou configure a variável de ambiente `ALLOWED_ORIGINS` com os domínios permitidos

Exemplo para produção:
```ruby
origins 'https://seusite.com', 'https://www.seusite.com'
```

## Licença

Este projeto está sob licença MIT.