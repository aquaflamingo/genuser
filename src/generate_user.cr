require "./generator.cr"

module GenerateUser
  VERSION = "0.1.0"

 class App
		def initialize(@conf = Hash(Symbol, String).new, @generator = Generator.new)
		end

    def start
			 results = @generator.gen(@conf[:n].to_i)

			 results. each do |r|
					puts r
			 end
    end
  end
end
