RSpec.describe Country, type: :model do
  subject(:country) { create :country }
  
  context 'association' do
    it { should belong_to :region }
    it { should have_one :fin_requirement }
  end
  
  context 'validation' do
    it { should validate_presence_of(:title) }
  end
end