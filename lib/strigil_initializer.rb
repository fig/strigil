
###
# DB Initialization
###

def db_configuration
  db_configuration_file = File.join(File.expand_path(__dir__), '..', 'db', 'config.yml')
  YAML.safe_load(File.read(db_configuration_file))
end

ENV['DB'] ||= 'development'

ActiveRecord::Base.establish_connection(db_configuration[ENV['DB']])
