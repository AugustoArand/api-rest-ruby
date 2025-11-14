const { createApp } = Vue;

createApp({
    data() {
        return {
            articles: [],
            loading: true,
            showModal: false,
            editingArticle: null,
            form: {
                title: '',
                content: '',
                published: false
            },
            apiUrl: 'http://localhost:3000/articles'
        }
    },
    mounted() {
        this.fetchArticles();
    },
    methods: {
        async fetchArticles() {
            try {
                this.loading = true;
                const response = await fetch(this.apiUrl);
                this.articles = await response.json();
            } catch (error) {
                alert('Erro ao carregar artigos: ' + error.message);
            } finally {
                this.loading = false;
            }
        },
        openCreateModal() {
            this.editingArticle = null;
            this.form = {
                title: '',
                content: '',
                published: false
            };
            this.showModal = true;
        },
        openEditModal(article) {
            this.editingArticle = article;
            this.form = {
                title: article.title,
                content: article.content,
                published: article.published
            };
            this.showModal = true;
        },
        closeModal() {
            this.showModal = false;
            this.editingArticle = null;
        },
        async saveArticle() {
            try {
                const url = this.editingArticle 
                    ? `${this.apiUrl}/${this.editingArticle.id}`
                    : this.apiUrl;
                
                const method = this.editingArticle ? 'PUT' : 'POST';
                
                const response = await fetch(url, {
                    method: method,
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        article: this.form
                    })
                });

                if (response.ok) {
                    await this.fetchArticles();
                    this.closeModal();
                    alert(this.editingArticle ? 'Artigo atualizado com sucesso!' : 'Artigo criado com sucesso!');
                } else {
                    alert('Erro ao salvar artigo');
                }
            } catch (error) {
                alert('Erro ao salvar artigo: ' + error.message);
            }
        },
        async deleteArticle(id) {
            if (!confirm('Tem certeza que deseja deletar este artigo?')) {
                return;
            }

            try {
                const response = await fetch(`${this.apiUrl}/${id}`, {
                    method: 'DELETE'
                });

                if (response.ok) {
                    await this.fetchArticles();
                    alert('Artigo deletado com sucesso!');
                } else {
                    alert('Erro ao deletar artigo');
                }
            } catch (error) {
                alert('Erro ao deletar artigo: ' + error.message);
            }
        }
    }
}).mount('#app');
