describe "FindQuoteController" do

  tests FindQuoteController

  it "should have a quote generator button" do
    view("Quote Generator Button").should != nil
  end

  before do
    @json_quote = {
      "contents"=> {
        "quote"=> "I wanted to beat the heck out of the JV guys for that, except I wouldn't know what to do in a fistfight without a manual. ,",
        "id"=> "5krzvfoA9GSEeNnUVmLVQQeF",
        "author"=> "Carrie Harris",
        "length"=> "123",
        "tags"=> [
          "fighting",
          "football",
          "funny",
          "manual",
          "nerd"
        ]
      }
    }
    controller.should.receive(:get_random_quote_from_api).and_yield(@json_quote)
  end

  it "should fetch a random quote when quote generator is pressed" do
    tap("Quote Generator Button")
    controller.quote.class.should == Quote
    controller.quote.author.should == "Carrie Harris"
    controller.quote.text.should == "I wanted to beat the heck out of the JV guys for that, except I wouldn't know what to do in a fistfight without a manual. ,"
  end

end
