require 'active_record'
require 'sluggify'

config = YAML.load_file('spec/config/database.yml')
ActiveRecord::Base.establish_connection(config['test'])
ActiveRecord::Base.connection.drop_database config['test']['database']
ActiveRecord::Base.connection.create_database config['test']['database']
ActiveRecord::Base.establish_connection(config['test'])
ActiveRecord::Base.connection.create_table 'users', {:force => true} do |table|
  table.column :name, :string
  table.column :age, :integer
  table.column :slug, :string
  table.column :slug_base, :string
end

require 'models/user'
