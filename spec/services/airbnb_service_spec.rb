RSpec.describe AirbnbService, "airbnb" do
   
  subject { AirbnbService.new('Berlin') } 
   
  context 'parse' do
    it 'must be return price and string' do
      info = subject.parse(52.520645, 13.409779)
      expect(info[:price].class).to eq(Fixnum)
      expect(info[:url].class).to eq(String)
    end
  end
    
end