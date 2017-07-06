
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'buildbridges',
  username: 'sabrina'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)
