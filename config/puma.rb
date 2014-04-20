workers Integer(ENV['PUMA_WORKERS'] || 0)
threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

preload_app! if ENV["PRELOAD_APP"]

port        ENV.fetch('PORT')
environment ENV.fetch('RACK_ENV')

on_worker_boot do
  # reset database and stuffs
end
