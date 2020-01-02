# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

 Rails.application.config.middleware.insert_before 0, Rack::Cors do
  #  allow do
  #    origins 'creator-backend-api.herokuapp.com/api/users'

  #    resource '*',
  #      headers: :any,
  #      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  #  end

    allow do
      origins 'starwars-character.netlify.com/'
      # Allows frontend app to communicate with rails backend

  resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
 end
