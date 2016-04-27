class Parser
  attr_reader :registers
  def initialize(content)
    @registers = []
    lines = content.split("\n")
    # get rid of the first line
    lines.shift
    parse_lines(lines)
  end

  def parse_lines(lines)
    lines.each do |line|
      words = line.split("\t")
      @registers.push(buyer: words.shift.force_encoding('UTF-8'),
                      description: words.shift,
                      unity_price: words.shift.to_f,
                      quantity: words.shift.to_i,
                      address: words.shift,
                      supplier: words.shift)
    end
  end
end
