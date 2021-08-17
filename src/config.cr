class Config
  DATA_ANIMALS = "data/animals.txt"
  DATA_COLOURS = "data/colours.txt"

  property file_paths : Hash(String, String) = Hash(String, String).new
  property delimitter : String = ""
  property count : String = ""
  property suffix : String = ""

	private def self.default_files
    {"animals" => DATA_ANIMALS, "colours" => DATA_COLOURS}
  end


  def self.build(&block : (Config) -> _) : Config
    c = Config.new
    c.file_paths = default_files

    block.call(c)

		return c
  end
end
