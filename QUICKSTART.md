# Guia de Início Rápido / Quick Start Guide

## Português

### Instalação Rápida

1. **Instale as dependências:**
   ```bash
   bundle install
   ```

2. **Configure o banco de dados:**
   ```bash
   bundle exec rake db:create db:migrate db:seed
   ```

3. **Inicie o servidor:**
   ```bash
   bundle exec puma
   ```

4. **Teste a API:**
   ```bash
   # Em outro terminal
   curl http://localhost:3000/articles
   ```

### Exemplos de Uso

#### Criar um artigo
```bash
curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -d '{
    "article": {
      "title": "Meu Artigo",
      "content": "Conteúdo do artigo",
      "published": true
    }
  }'
```

#### Listar todos os artigos
```bash
curl http://localhost:3000/articles
```

#### Buscar um artigo específico
```bash
curl http://localhost:3000/articles/1
```

#### Atualizar um artigo
```bash
curl -X PUT http://localhost:3000/articles/1 \
  -H "Content-Type: application/json" \
  -d '{
    "article": {
      "title": "Título Atualizado"
    }
  }'
```

#### Deletar um artigo
```bash
curl -X DELETE http://localhost:3000/articles/1
```

### Executar Testes
```bash
bundle exec ruby -I test test/models/article_test.rb
bundle exec ruby -I test test/controllers/articles_controller_test.rb
```

---

## English

### Quick Installation

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Setup database:**
   ```bash
   bundle exec rake db:create db:migrate db:seed
   ```

3. **Start the server:**
   ```bash
   bundle exec puma
   ```

4. **Test the API:**
   ```bash
   # In another terminal
   curl http://localhost:3000/articles
   ```

### Usage Examples

#### Create an article
```bash
curl -X POST http://localhost:3000/articles \
  -H "Content-Type: application/json" \
  -d '{
    "article": {
      "title": "My Article",
      "content": "Article content",
      "published": true
    }
  }'
```

#### List all articles
```bash
curl http://localhost:3000/articles
```

#### Get a specific article
```bash
curl http://localhost:3000/articles/1
```

#### Update an article
```bash
curl -X PUT http://localhost:3000/articles/1 \
  -H "Content-Type: application/json" \
  -d '{
    "article": {
      "title": "Updated Title"
    }
  }'
```

#### Delete an article
```bash
curl -X DELETE http://localhost:3000/articles/1
```

### Run Tests
```bash
bundle exec ruby -I test test/models/article_test.rb
bundle exec ruby -I test test/controllers/articles_controller_test.rb
```
