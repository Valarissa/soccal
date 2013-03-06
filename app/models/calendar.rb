class Calendar
  attr_accessor :id
  @@next_id = 0

  def initialize(options={})
    self.id = options[:id].try(:to_i) || auto_incremented_id
  end

  def auto_incremented_id
    @@next_id += 1
  end

  def to_param
    id
  end
end
