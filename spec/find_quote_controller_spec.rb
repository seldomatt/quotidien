describe "FindQuoteController" do

  tests FindQuoteController

  it "should have a quote generator button" do
    view("Quote Generator Button").should != nil
  end

end
