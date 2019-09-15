# frozen_string_literal: true

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
