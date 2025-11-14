# Frontend Vue.js - Blog API

Interface moderna e responsiva para gerenciamento de artigos, desenvolvida com Vue.js 3.

## 📁 Estrutura do Projeto

```
frontend/
├── index.html          # Estrutura HTML da aplicação
├── css/
│   └── styles.css      # Estilos, animações e design responsivo
├── js/
│   └── app.js          # Lógica Vue.js e integração com API
└── README.md           # Documentação
```

## 🎨 Características

- **Design Moderno**: Interface com gradientes e animações suaves
- **Responsivo**: Funciona perfeitamente em desktop e mobile
- **CRUD Completo**: Criar, listar, editar e deletar artigos
- **Integração Total**: Conectado com a API Ruby REST
- **Código Modular**: HTML, CSS e JavaScript em arquivos separados
- **Sem Build**: Usa Vue.js via CDN (perfeito para estudos)

## 🚀 Como Usar

### 1. Inicie o Backend Ruby

No diretório raiz do projeto, certifique-se de que a API está rodando:

```bash
# No terminal 1
cd /home/usuario/Documentos/ruby/api-rest-ruby
bundle exec puma
```

A API deve estar rodando em `http://localhost:3000`

### 2. Abra o Frontend

Você tem 3 opções:

#### Opção A: Abrir diretamente no navegador
```bash
# No terminal 2
cd frontend
xdg-open index.html  # Linux
# ou simplesmente abra o arquivo index.html no seu navegador
```

#### Opção B: Usar um servidor HTTP simples (recomendado)
```bash
# Com Python 3
cd frontend
python3 -m http.server 8080

# Depois acesse: http://localhost:8080
```

#### Opção C: Usar extensão Live Server do VS Code
- Instale a extensão "Live Server"
- Clique com botão direito no `index.html`
- Selecione "Open with Live Server"

## 📋 Funcionalidades

### ✨ Criar Artigo
1. Clique no botão "Criar Novo Artigo"
2. Preencha o título e conteúdo
3. Marque "Publicar imediatamente" se desejar publicá-lo
4. Clique em "Criar"

### 📖 Listar Artigos
- Os artigos são carregados automaticamente ao abrir a página
- Cards coloridos mostram o status (Publicado/Rascunho)

### ✏️ Editar Artigo
1. Clique no botão "Editar" no card do artigo
2. Modifique os campos desejados
3. Clique em "Salvar"

### 🗑️ Deletar Artigo
1. Clique no botão "Deletar" no card do artigo
2. Confirme a exclusão

## 🎨 Paleta de Cores

- **Gradiente Principal**: Roxo (#667eea) → Violeta (#764ba2)
- **Publicado**: Verde (#00b894)
- **Rascunho**: Amarelo (#fdcb6e)
- **Editar**: Laranja (#ffa502)
- **Deletar**: Vermelho (#ff4757)

## 🛠️ Tecnologias

- **Vue.js 3**: Framework JavaScript progressivo
- **Fetch API**: Para requisições HTTP
- **CSS3**: Animações e gradientes modernos
- **Google Fonts**: Família Poppins

## 📝 Arquitetura e Código

### 📄 `index.html`
Contém a estrutura HTML da aplicação:
- Header com título e descrição
- Botão de criar novo artigo
- Grid de artigos com cards
- Modal para criar/editar artigos

### 🎨 `css/styles.css`
Todos os estilos da aplicação:
- Reset CSS e tipografia
- Layout com Flexbox e CSS Grid
- Animações (@keyframes)
- Design responsivo com media queries
- Temas de cores para diferentes estados

### ⚙️ `js/app.js`
Lógica da aplicação Vue.js:

```javascript
// Principais métodos:
- fetchArticles()     // GET - Lista todos os artigos
- saveArticle()       // POST/PUT - Cria ou atualiza artigo
- deleteArticle(id)   // DELETE - Remove artigo
- openCreateModal()   // Abre modal de criação
- openEditModal()     // Abre modal de edição
- closeModal()        // Fecha o modal
```

### 🔄 Fluxo de Dados
```
API Ruby (Backend) ←→ Fetch API ←→ Vue.js ←→ DOM
```

## 🐛 Troubleshooting

### Erro de CORS
Se aparecer erro de CORS no console:
- Verifique se o arquivo `config/initializers/cors.rb` está configurado
- Certifique-se de que a API está rodando em `http://localhost:3000`
- Reinicie o servidor Puma

### Artigos não carregam
- Verifique se a API está rodando: `curl http://localhost:3000/articles`
- Abra o console do navegador (F12) para ver erros
- Confirme que existem artigos no banco de dados

### Interface não carrega
- Verifique sua conexão com a internet (Vue.js é carregado via CDN)
- Tente usar um servidor HTTP local em vez de abrir o arquivo diretamente

## 📚 Para Estudar Mais

- [Documentação Vue.js 3](https://vuejs.org/)
- [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
- [CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [CSS Animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations)

## 💡 Dicas de Personalização

1. **Mudar cores**: Edite as variáveis de cores em `css/styles.css`
2. **Adicionar campos**: 
   - Modifique o objeto `form` em `js/app.js`
   - Adicione campos no formulário em `index.html`
3. **Trocar animações**: Ajuste os `@keyframes` em `css/styles.css`
4. **Adicionar filtros**: Implemente computed properties no Vue em `js/app.js`
5. **Mudar API URL**: Altere `apiUrl` em `js/app.js`

## 🎯 Vantagens da Modularização

✅ **Manutenção**: Mais fácil encontrar e editar código específico  
✅ **Reutilização**: CSS e JS podem ser compartilhados  
✅ **Organização**: Separação clara de responsabilidades  
✅ **Colaboração**: Múltiplos desenvolvedores podem trabalhar simultaneamente  
✅ **Performance**: Possibilidade de cache por arquivo  

---

**Desenvolvido para fins educacionais** 🎓
