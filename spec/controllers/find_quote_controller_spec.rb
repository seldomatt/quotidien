describe "FindQuoteController" do

  tests FindQuoteController

  it "should have a quote generator button" do
    view("Quote Generator Button").should != nil
  end

  before do
    @quote = {
      author: "Henry Miller",
      text: "The aim of life is to live, and to live means to be aware, joyously, drunkenly, serenely, divinely aware."
    }
    controller.should.receive(:get_random_quote_from_api).and_yield(@quote)
  end

  it "should fetch a random quote when quote generator is pressed" do
    tap("Quote Generator Button")
    controller.quote.should == @quote
  end

end
