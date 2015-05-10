require_relative '../../documentation/documentation'

namespace :documentation do
  desc 'generates a documentation file from the README and the rspec documentation'
  task(generate: :environment) { Documentation.generate }
end
