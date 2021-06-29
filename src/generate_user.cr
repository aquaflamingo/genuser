require "./generator.cr"

module GenerateUser
  VERSION = "0.1.0"

 class App
		property count : String
		property delimitter : String

		def initialize(@conf = Hash(Symbol, String).new, @generator = Generator.new)
			 @count = @conf[:n]
			 @delimitter = @conf[:delimitter]
		end

    def start
			 results = @generator.gen(@count.to_i, @delimitter)

			 puts "Genearting #{@count} usernames"

			 results.each do |r|
					puts r
			 end
    end
  end
end
