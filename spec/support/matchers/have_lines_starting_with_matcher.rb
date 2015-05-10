RSpec::Matchers.define :have_lines_starting_with do |expected|
  match { |actual| /^#{actual}/.match(expected) }
end
