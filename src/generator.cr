class Generator
  DATA_ANIMALS = "data/animals.txt"
  DATA_COLOURS = "data/colours.txt"

  def gen(n = 1, delimitter = "-")
    content = Hash(String, Array(String)).new

    content["colours"] = Array(String).new
    content["animals"] = Array(String).new

    read_concurrent(DATA_COLOURS, "colours", content, delimitter)
    read_concurrent(DATA_ANIMALS, "animals", content, delimitter)

    # Wait for reading content
    Fiber.yield

    results = Array(Array(String)).new

    n.times do
      results << permutate_with(content["animals"], content["colours"], delimitter)
    end

    results.flatten
  end

  def permutate_with(src1 : Array(String), src2 : Array(String), delimitter = "")
    s1 = src1.sample
    s2 = src2.sample

    res = [] of String

    [s1, s2].each_permutation do |p|
      res << p.join(delimitter)
    end

    return res
  end

  def read_concurrent(f : String, collection_key : String, content : Hash(String, Array(String)), delimitter : String)
    # concurrently read each line of the file and append to the array
    spawn do
      File.each_line f, chomp: true do |l|
        content[collection_key] << l.downcase.sub(" ", delimitter)
      end
    end
  end
end
