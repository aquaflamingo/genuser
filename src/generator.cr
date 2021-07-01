require "./content_registry.cr"

class Generator
	 private property registry : ContentRegistry

	 def initialize(file_paths : Hash(String, String) = Hash(String, String).new, use_delimitter = "")

			@delimitter = use_delimitter
			@registry = ContentRegistry.build_from(file_paths,  @delimitter)
	 end

	 def generate(content : Array(String), n = 1)
			content = content.uniq

			registries = content.map { |content_name| @registry.fetch(content_name) }

			results = Array(Array(String)).new

			n.times do

				 results << permutate_with registries, @delimitter
			end

			results.flatten
	 end

	 def permutate_with(content_srcs : Array(Array(String)), delimitter = "")
			sample_list = content_srcs.map {|src| src.sample}

			res = [] of String

			sample_list.each_permutation do |p|
				 res << p.join(delimitter)
			end

			return res
	 end
end
