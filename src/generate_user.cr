require "./generator.cr"
require "./config.cr"
require "./version.cr"

module GenerateUser
  class App
    private property generator : Generator

    def initialize(conf = Hash(Symbol, String).new)
      @config = Config.build do |c|
        c.count = conf[:n]
        c.delimitter = conf[:delimitter]
        c.suffix = conf[:suffix]
      end

      @generator = Generator.new(@config)
    end

    def start
      results = @generator.generate(
        content: ["animals", "colours"],
        n: @config.count.to_i,
      )

      puts "Generating #{@config.count} usernames"

      results.each do |r|
        puts r
      end
    end
  end
end
