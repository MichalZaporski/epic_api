Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "http://localhost:19000", "http://localhost:19006", /\Ahttp:\/\/\d+\.\d+\.\d+\.\d+(:\d+)?\z/
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
end