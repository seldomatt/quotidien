describe "Quote" do

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
  end

  it "should have an author and text" do
    quote = Quote.new.tap { |q| q.author = "Henry Miller"; q.text = "I'm a great author and very smart" }
    quote.author.should == "Henry Miller"
    quote.text.should == "I'm a great author and very smart"
  end

  it "should instantiate a quote from json" do
    quote = Quote.from_json(@json_quote)
    quote.author.should == "Carrie Harris"
    quote.text.should == "I wanted to beat the heck out of the JV guys for that, except I wouldn't know what to do in a fistfight without a manual. ,"
  end


end