require "./content_registry.cr"
require "./config.cr"

# +Generator+ generates a desired number of usernames using the file content provided
class Generator
  private property registry : ContentRegistry

  def initialize(config : Config)
    @delimitter = config.delimitter.as(String)
    @suffix = config.suffix.as(String)
    @registry = ContentRegistry.build_from(config.file_paths, @delimitter)
  end

  # Generate *n* user names using sourcing from the *content*
  def generate(content : Array(String), n = 1)
    content = content.uniq

    registries = content.map { |content_name| @registry.fetch(content_name) }

    results = Array(Array(String)).new

    n.times do
      results << permutate_with registries, @delimitter, @suffix
    end

    results.flatten
  end

  def permutate_with(content_srcs : Array(Array(String)), delimitter = "", suffix="")
    sample_list = content_srcs.map { |src| src.sample }

    res = [] of String

    sample_list.each_permutation do |p|
			 res << p.join(delimitter) + suffix
    end

    return res
  end
end
