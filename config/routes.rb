Rage.routes.draw do
  root to: ->(env) { [200, {}, "It works!"] }
  get '/hello', to: ->(env) { [200, {}, "Hello, World!"] }
  get '/goodbye', to: ->(env) { [200, {}, "Goodbye, World!"] }

  # Example of a route with a parameter
  get '/greet', to: ->(env) {
    name = env['QUERY_STRING'].split('=').last || 'Stranger'
    [200, {}, "Hello, #{name}!"]
  }
end