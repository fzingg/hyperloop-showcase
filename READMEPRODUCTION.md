Remove the 2 lines from :

#config/application.rb
config.eager_load_paths += %W(#{config.root}/app/views/components)
config.autoload_paths += %W(#{config.root}/app/views/components)

Modify config/initializers/hyper_mesh.rb

HyperMesh.configuration do |config|
  config.transport = :simple_poller
end

or config :action_cable with 

config.action_cable.allowed_request_origins = [/http\:\/\/127.0.0.1\:[0-9]*/]


Remove the youtube video.


config/environments/production.rb
config.assets.compile = true