class FindQuoteController < UIViewController

  attr_accessor :quote

  stylesheet :find_quote_controller

  def set_quote(quote_contents)
    self.quote = Quote.from_json(quote_contents)
  end

  layout :root do
    subview(UIButton, :find_a_quote_button).on(:touch) do
      get_random_quote_from_api do |quote_contents|
        set_quote(quote_contents)
      end
    end
  end

  def get_random_quote_from_api(&block)
    BW::HTTP.get("http://api.theysaidso.com/qod.json") do |response|
      if response.ok?
        result = BW::JSON.parse(response.body)
        yield result["contents"]
      end
    end
  end

  #"{\"success\"=>{\"total\"=>1}, \"contents\"=>{\"quote\"=>\"I wanted to beat the heck out of the JV guys for that, except I wouldn't know what to do in a fistfight without a manual. ,\", \"id\"=>\"5krzvfoA9GSEeNnUVmLVQQeF\", \"author\"=>\"Carrie Harris\", \"length\"=>\"123\", \"tags\"=>[\"fighting\", \"football\", \"funny\", \"manual\", \"nerd\"]}}"

end

Teacup::Stylesheet.new(:find_quote_controller) do

  style :root,
        backgroundColor: "#74C0E2".uicolor

  style :find_a_quote_button,
        constraints: [
          :center_x,
          constrain_top(50),
          constrain_height(75),
          constrain_width(200)
        ],
        title: "Find a Quote!",
        accessibilityLabel: "Quote Generator Button",
        backgroundColor: :white,
        color: "#74C0E2".uicolor,
        font: "HelveticaNeue-Light".uifont(24)

end