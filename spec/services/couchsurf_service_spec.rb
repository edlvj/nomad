RSpec.describe CouchsurfService, "couchsurf" do
   
  subject { CouchsurfService.new('Berlin') } 
   
  context 'parse' do
    it 'must be return price and string' do
      info = subject.parse
      expect(info[:hosts].class).to eq(Fixnum)
      expect(info[:url].class).to eq(String)
    end
  end
    
end