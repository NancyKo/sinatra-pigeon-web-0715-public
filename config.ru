require './config/environment.rb'
use Rack::MethodOverride

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use PigeonsController
run ApplicationController