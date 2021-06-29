require "option_parser"
require "./generate_user.cr"

opts = Hash(Symbol, String).new 
opts[:n] = "1"

OptionParser.parse do |parser|
  parser.banner = "Welcome to CrystalBooks"

	parser.on "-n", "--number count", "Number to generate" do |n| 
		 opts[:n] = n
	end

  parser.on "-v", "--version", "Show version" do
		 puts "#{GenerateUser::VERSION}"
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
end

app = GenerateUser::App.new(opts)
app.start
