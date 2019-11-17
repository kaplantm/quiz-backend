# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if Rails.env.production?
    allow do
      origins /\Ahttps:\/\/kaplantm.github.io/
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  else
      allow do
        origins /\A(http:\/\/)?127\.0\.0\.1(:\d+)?\/?\z/, /\A(http:\/\/)?localhost(:\d+)?\/?\z/
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
  end
end
