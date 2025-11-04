# CORS configuration
# WARNING: For production use, replace '*' with specific allowed origins
# Example: origins 'https://example.com', 'https://www.example.com'
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TODO: In production, replace '*' with specific allowed origins
    origins ENV.fetch('ALLOWED_ORIGINS', '*')
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
