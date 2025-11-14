# api-rest-ruby

API REST em Ruby com estrutura CRUD completa + Frontend Vue.js.

## Sobre

Esta é uma API REST construída com Ruby (Rack + ActiveRecord) que implementa operações CRUD (Create, Read, Update, Delete) para gerenciar artigos. O projeto inclui um frontend moderno desenvolvido com Vue.js 3 para interagir com a API.

## 🎯 Características

- ✅ **API REST completa** com operações CRUD
- 🎨 **Frontend Vue.js 3** moderno e responsivo
- 📦 **Código modular** (HTML, CSS e JavaScript separados)
- 💾 **Persistência de dados** com SQLite3
- 🔄 **CORS configurado** para integração frontend-backend
- 🧪 **Testes** incluídos

## Requisitos

- Ruby 3.2.x
- SQLite3
- Bundler
- Navegador web moderno (para o frontend)

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

### Opção 1: Backend + Frontend (Recomendado)

#### 1. Inicie o servidor backend

```bash
bundle exec puma
```

O servidor estará disponível em `http://localhost:3000`

#### 2. Abra o frontend

**Usando servidor HTTP Python (recomendado):**
```bash
# Em outro terminal
cd frontend
python3 -m http.server 8080
```

Acesse: `http://localhost:8080`

**Ou abra diretamente no navegador:**
```bash
cd frontend
xdg-open index.html  # Linux
# ou open index.html (macOS)
# ou start index.html (Windows)
```

### Opção 2: Apenas Backend (API)

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
├── app/                    # Backend Ruby
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   └── articles_controller.rb
│   └── models/
│       ├── application_record.rb
│       └── article.rb
├── config/                 # Configurações
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── puma.rb
│   ├── environments/
│   ├── initializers/
│   │   └── cors.rb        # Configuração CORS
│   └── routes.rb
├── db/                     # Banco de dados
│   ├── development.sqlite3
│   └── migrate/
│       └── 20231101000000_create_articles.rb
├── frontend/               # Frontend Vue.js ⭐ NOVO
│   ├── index.html         # Estrutura HTML
│   ├── css/
│   │   └── styles.css     # Estilos e animações
│   ├── js/
│   │   └── app.js         # Lógica Vue.js
│   └── README.md          # Documentação do frontend
├── test/                   # Testes
│   ├── controllers/
│   ├── fixtures/
│   └── models/
├── Gemfile
├── Rakefile
├── config.ru
├── QUICKSTART.md          # Guia rápido
└── README.md
```

## Tecnologias Utilizadas

### Backend
- Ruby 3.2
- Rack
- ActiveRecord 7.2
- SQLite3
- Puma (servidor web)

### Frontend
- Vue.js 3 (via CDN)
- CSS3 (Flexbox, Grid, Animations)
- Fetch API
- Google Fonts (Poppins)

## Persistência de Dados

💾 **Os dados são salvos permanentemente!** 

Todos os artigos criados via POST ficam armazenados no arquivo `db/development.sqlite3` e **não são perdidos** quando a aplicação é fechada. SQLite é um banco de dados real que persiste os dados no disco.

## 🎨 Frontend Vue.js

O projeto inclui um frontend completo e moderno desenvolvido com Vue.js 3. Veja mais detalhes em [`frontend/README.md`](frontend/README.md).

### Características do Frontend

- **Design Moderno**: Gradientes, animações e interface responsiva
- **CRUD Completo**: Criar, listar, editar e deletar artigos
- **Código Modular**: HTML, CSS e JavaScript em arquivos separados
- **Sem Build**: Usa Vue.js via CDN (perfeito para estudos)
- **Integração Direta**: Conecta com a API Ruby via Fetch API

### Quick Start Frontend

```bash
# Terminal 1: Inicie o backend
bundle exec puma

# Terminal 2: Inicie o frontend
cd frontend
python3 -m http.server 8080

# Acesse: http://localhost:8080
```

## 📚 Documentação Adicional

- **[QUICKSTART.md](QUICKSTART.md)** - Guia rápido de início (PT/EN)
- **[frontend/README.md](frontend/README.md)** - Documentação completa do frontend

## Segurança

⚠️ **Nota Importante**: A configuração CORS atual permite acesso de qualquer origem (`*`). Para uso em produção:

1. Defina origens específicas permitidas no arquivo `config/initializers/cors.rb`
2. Ou configure a variável de ambiente `ALLOWED_ORIGINS` com os domínios permitidos

Exemplo para produção:
```ruby
origins 'https://seusite.com', 'https://www.seusite.com'
```

## 🤝 Contribuindo

Este é um projeto educacional. Sinta-se livre para fazer fork, experimentar e aprender!

## 📝 Licença

Este projeto está sob licença MIT.