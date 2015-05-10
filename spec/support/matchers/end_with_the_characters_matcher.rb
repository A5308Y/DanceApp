RSpec::Matchers.define :end_with_the_characters do |expected|
  match do |actual|
    expected_characters = Array(expected)
    actual.chars.last(expected_characters.length) == expected_characters
  end
end
