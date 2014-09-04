require 'rspec'
require 'quipper-mixpanel-exporter'
require 'securerandom'

Dir["./support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
end
