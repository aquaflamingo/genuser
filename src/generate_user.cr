require "./generator.cr"

module GenerateUser
  VERSION = "0.1.0"

 class App
	 DATA_ANIMALS = "data/animals.txt"
	 DATA_COLOURS = "data/colours.txt"
		private property generator : Generator
		private property count : String

		def initialize(@conf = Hash(Symbol, String).new)
			
			 files = { "animals" => DATA_ANIMALS, "colours" => DATA_COLOURS }

			 @count = @conf[:n]

			 @generator = Generator.new(files, use_delimitter: @conf[:delimitter])
		end

    def start
			 results = @generator.generate(
					content: ["animals", "colours"], 
					n: @count.to_i, 
			 )

			 puts "Generating #{@count} usernames"

			 results.each do |r|
					puts r
			 end
    end
  end
end
