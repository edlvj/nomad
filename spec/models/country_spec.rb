RSpec.describe Country, type: :model do
  subject(:country) { create :country }
  
  context 'association' do
    it { should belong_to :region }
  end
  
  context 'validation' do
    it { should validate_presence_of(:title) }
  end
end