class FindQuoteController < UIViewController

  attr_accessor :quote

  stylesheet :find_quote_controller

  def set_quote(quote_contents)
    self.quote = Quote.from_json(quote_contents)
  end

  layout :root do
    @random_quote_button = subview(UIButton, :find_a_quote_button)
  end

  def layoutDidLoad
    @random_quote_button.on(:touch) do
      get_random_quote_from_api do |quote_contents|
        set_quote(quote_contents)
        show_quote
      end
    end
  end

  def show_quote
    layout(view) do
      @quote_text = subview(quote.formatted_quote.uilabel, :quote_label, alpha: 0.0)
    end
    view.apply_constraints
    UIView.animateWithDuration(2.0, animations: lambda {
      @quote_text.alpha = 1.0
    })
  end

  def get_random_quote_from_api(&block)
    BW::HTTP.get("http://api.theysaidso.com/qod.json") do |response|
      if response.ok?
        result = BW::JSON.parse(response.body)
        block.call(result)
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

  style :quote_label,
        constraints: [
          :center_x,
          constrain_width(290),
          constrain_below(:find_a_quote_button, 30),
          constrain_height(200)
        ],
        font: "HelveticaNeue-Light".uifont(18),
        color: :white,
        accessibilityLabel: "Generated Quote Text",
        numberOfLines: 0,
        preferredMaxLayoutWidth: 290,
        lineBreakMode: NSLineBreakByWordWrapping

end