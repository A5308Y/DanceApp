require_relative 'combiner'
require_relative 'formatter'
require_relative 'rspec_trimmer'
require_relative 'raw_data'
require_relative 'writer'
require_relative 'config'

module Documentation
  def self.generate
    raw_data = RawData.new(io: File, config: Config)
    combiner = Combiner.new(formatter: Formatter.new, trimmer: RspecTrimmer.new, raw_data: raw_data)

    Writer.new(io: File, result: combiner.run, config: Config).save
  end
end
