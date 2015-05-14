module Documentation
  class RspecTrimmer
    def run(content_to_be_trimmed)
      content_to_be_trimmed.each_line.inject('') { |a, e| next_result(a, e) }.strip << "\n"
    end

    private

    def next_result(result, line)
      to_be_trimmed?(line) ? result : result << line
    end

    def to_be_trimmed?(line)
      exclude_line_conditions.any? { |condition| condition.match(line) }
    end

    def exclude_line_conditions
      [/^Finished in.*/, /^Randomized.*/, /^.*\d+ examples, \d+ failures/]
    end
  end
end
