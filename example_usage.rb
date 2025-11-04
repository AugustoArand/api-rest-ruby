#!/usr/bin/env ruby

# Script de exemplo para demonstrar o uso da API CRUD de Artigos
# Example script to demonstrate the Articles CRUD API usage

require 'net/http'
require 'json'
require 'uri'

BASE_URL = 'http://localhost:3000'

def make_request(method, path, body = nil)
  uri = URI.join(BASE_URL, path)
  
  case method
  when :get
    request = Net::HTTP::Get.new(uri)
  when :post
    request = Net::HTTP::Post.new(uri)
  when :put
    request = Net::HTTP::Put.new(uri)
  when :delete
    request = Net::HTTP::Delete.new(uri)
  end
  
  request['Content-Type'] = 'application/json' if body
  request.body = body.to_json if body
  
  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end
  
  puts "#{method.upcase} #{path}"
  puts "Status: #{response.code}"
  puts "Response: #{response.body}" unless response.body.empty?
  puts "\n"
  
  JSON.parse(response.body) unless response.body.empty?
rescue JSON::ParserError
  response.body
end

# Criar um novo artigo / Create a new article
puts "=== Criando novo artigo / Creating new article ==="
article = make_request(:post, '/articles', {
  article: {
    title: 'Introdução ao Ruby on Rails',
    content: 'Ruby on Rails é um framework web poderoso e elegante.',
    published: true
  }
})

article_id = article['id']

# Listar todos os artigos / List all articles
puts "=== Listando todos os artigos / Listing all articles ==="
make_request(:get, '/articles')

# Buscar um artigo específico / Get a specific article
puts "=== Buscando artigo específico / Getting specific article ==="
make_request(:get, "/articles/#{article_id}")

# Atualizar um artigo / Update an article
puts "=== Atualizando artigo / Updating article ==="
make_request(:put, "/articles/#{article_id}", {
  article: {
    title: 'Introdução ao Ruby on Rails - Atualizado',
    content: 'Ruby on Rails é um framework web poderoso, elegante e produtivo.'
  }
})

# Deletar um artigo / Delete an article
puts "=== Deletando artigo / Deleting article ==="
make_request(:delete, "/articles/#{article_id}")

# Verificar que foi deletado / Verify it was deleted
puts "=== Verificando que foi deletado / Verifying deletion ==="
make_request(:get, '/articles')
