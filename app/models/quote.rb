class Quote

  attr_accessor :author, :text

  def self.from_json(json)
    new.tap do |quote|
      quote.author = json["contents"]["author"]
      quote.text = json["contents"]["quote"]
    end
  end

  def formatted_quote
    "#{text}\n- #{author}"
  end

end