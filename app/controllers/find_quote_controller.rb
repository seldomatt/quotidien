class FindQuoteController < UIViewController

  stylesheet :find_quote_controller

  layout :root do
    subview(UIButton, :find_a_quote_button)
  end

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