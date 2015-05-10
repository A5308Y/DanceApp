RSpec::Matchers.define :show_the_number_of_run_examples_and_failures do
  match { |actual| /^\d+ examples, \d+ failures/.match(actual) }
end
