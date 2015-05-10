RSpec::Matchers.define :include_colorizing_strings do
  color_pattern = /\e\[(\d+)(;\d+)*m/
  match { |actual| color_pattern.match(actual) }
end
