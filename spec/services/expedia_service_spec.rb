RSpec.describe ExpediaService, "expedia" do
   
  subject { ExpediaService.new('Berlin', 'Germany') } 
   
  context 'parse' do
    it 'must be return float' do
      info = subject.parse(52.520645, 13.409779)
      expect(info[:data].class).to eq(Array)
      expect(info[:url].class).to eq(String)
    end
  end  
end