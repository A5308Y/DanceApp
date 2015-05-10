require 'lib_helper'
require 'documentation/rspec_trimmer'
require 'support/matchers/end_with_the_characters_matcher'
require 'support/matchers/have_lines_starting_with_matcher'
require 'support/matchers/show_the_number_of_run_examples_and_failures_matcher'

describe Documentation::RspecTrimmer do
  let(:example_file_content) do
    %{
Randomized with seed 63528

Documentation::RspecTrimmer
  the result of #trimmed
    should not include "Randomized"
    should not end with the characters "\n" and "\n"
    should end with the characters "\n"
    should not include "Finished in"
    should not include "failures"
    should not include "Run options"
    includes the documentation strings from the rspec documentation

Finished in 0.00365 seconds (files took 0.12841 seconds to load)
7 examples, 0 failures

Randomized with seed 63528
    }
  end

  subject(:trimmed_documentation) { Documentation::RspecTrimmer.new.run(example_file_content) }
  let(:expected_beginning) do
    "Documentation::RspecTrimmer\n  the result of #trimmed\n    should not include \"Randomized\""
  end

  describe 'the result of #run' do
    describe "shows rspec's documentation output:" do
      it { is_expected.to start_with(expected_beginning) }
    end

    describe 'filters rspec output not useful for a documentation:' do
      it { is_expected.not_to have_lines_starting_with('Run options') }
      it { is_expected.not_to have_lines_starting_with('Finished in') }
      it { is_expected.not_to have_lines_starting_with('Randomized') }
      it { is_expected.not_to show_the_number_of_run_examples_and_failures }

      describe 'but not lines that have the same words as rspec output in their description:' do
        it { is_expected.to include('Run options') }
        it { is_expected.to include('Finished in') }
        it { is_expected.to include('Randomized') }
        it { is_expected.to include('failures') }
      end
    end

    describe 'ensures exactly one empty newline:' do
      it { is_expected.not_to end_with_the_characters ["\n", "\n"] }
      it { is_expected.to end_with_the_characters "\n" }
    end
  end
end
