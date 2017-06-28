RSpec.describe CouchsurfService, "couchsurf" do
   
  subject { CouchsurfService.new('Berlin') } 
   
  context 'parse' do
    it 'must be return price and string' do
      info = subject.parse(52.520645, 13.409779)
      expect(info[:hosts].class).to eq(String)
      expect(info[:url].class).to eq(String)
    end
  end
    
end