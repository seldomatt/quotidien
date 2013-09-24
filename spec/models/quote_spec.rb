describe "Quote" do

  it "should have an author and text" do
    quote = Quote.new.tap {|q| q.author = "Henry Miller"; q.text = "I'm a great author and very smart"}
    quote.author.should == "Henry Miller"
    quote.text.should == "I'm a great author and very smart"
  end


end