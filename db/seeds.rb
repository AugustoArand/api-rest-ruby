# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Article.destroy_all

# Create sample articles
Article.create!([
  {
    title: 'Bem-vindo ao Ruby on Rails',
    content: 'Ruby on Rails é um framework de desenvolvimento web escrito em Ruby. Ele foi projetado para tornar a programação de aplicações web mais fácil, fazendo suposições sobre o que todo desenvolvedor precisa para começar.',
    published: true
  },
  {
    title: 'Princípios do Rails',
    content: 'Rails segue dois princípios principais: DRY (Don\'t Repeat Yourself) e Convention over Configuration. Esses princípios ajudam os desenvolvedores a escrever menos código e ter mais produtividade.',
    published: true
  },
  {
    title: 'Active Record',
    content: 'Active Record é a camada de mapeamento objeto-relacional (ORM) do Rails. Ele facilita a interação com bancos de dados, permitindo que você trabalhe com objetos Ruby em vez de escrever SQL diretamente.',
    published: true
  },
  {
    title: 'RESTful APIs com Rails',
    content: 'Rails torna extremamente fácil criar APIs RESTful. Com apenas algumas linhas de código, você pode ter um conjunto completo de endpoints para criar, ler, atualizar e deletar recursos.',
    published: false
  },
  {
    title: 'Testes no Rails',
    content: 'Rails vem com um excelente suporte para testes. Você pode escrever testes de modelo, controlador, integração e sistema para garantir que sua aplicação funcione corretamente.',
    published: false
  }
])

puts "Criados #{Article.count} artigos de exemplo!"
