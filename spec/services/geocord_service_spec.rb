RSpec.describe GeocordService, "geocord" do
   
  subject { GeocordService.new('Berlin') } 
   
  context 'parse' do
    it 'must be return float' do
      info = subject.getCord
      expect(info.lat.class).to eq(Float)
      expect(info.lng.class).to eq(Float)
    end
  end
    
end