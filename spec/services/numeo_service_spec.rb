RSpec.describe NumeoService, "numeo" do
   
  subject { NumeoService.new('Berlin') } 
   
  context 'parse' do
    it 'must be return price and string' do
      info = subject.parse
      expect(info[:price].class).to eq(Fixnum)
      expect(info[:url].class).to eq(String)
    end
  end
    
end