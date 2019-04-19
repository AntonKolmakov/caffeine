# threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 5)
# workers Integer(ENV['PUMA_WORKERS'] || 3)
#
# rackup DefaultRackup
# port ENV['PORT']
# environment ENV['RACK_ENV']
#
# preload_app!
#
# on_worker_boot do
#   ActiveSupport.on_load(:active_record) do
#     config = ActiveRecord::Base.configurations[Rails.env] ||
#       Rails.application.config.database_configuration[Rails.env]
#     config['pool'] = ENV['DB_POOL'] || ENV['MAX_THREADS'] || 5
#     config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10
#     ActiveRecord::Base.establish_connection(config)
#   end
# end
