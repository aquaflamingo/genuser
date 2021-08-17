require "option_parser"
require "./generate_user.cr"

opts = Hash(Symbol, String).new 
opts[:n] = "1"
opts[:delimitter] = ""
opts[:suffix] = ""

OptionParser.parse do |parser|
  parser.banner = "genuser - generate fun usernames"
	
	parser.on "-d", "--delimitter -", "Delimitter to separate with" do |d| 
		 opts[:delimitter] = d
	end

	parser.on "-n", "--number count", "Number to generate" do |n| 
		 opts[:n] = n
	end

	parser.on "-s", "--suffix suffix", "Suffix to end to" do |suffix|
		 opts[:suffix] = suffix
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
