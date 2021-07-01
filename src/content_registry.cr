class ContentRegistry
	 def self.build_from(paths : Hash(String, String), delimitter = "")
			registry = Hash(String, Array(String)).new

			# Concurrently read fiels and populate registry
			populate_content = ->(key : String, file : String) do
				 spawn do
						File.each_line file, chomp: true do |l|
							 registry[key] << l.downcase.sub(" ", delimitter)
						end
				 end
			end

			# Initialize
			paths.each do |key, file_path|
				 registry[key] = Array(String).new

				 populate_content.call(key, file_path)
			end

			Fiber.yield

			new(registry)
	 end

	 def fetch(k : String)
			@registry[k]
	 end

	 private def initialize(registry : Hash(String, Array(String)))
			@registry = registry
	 end
end
