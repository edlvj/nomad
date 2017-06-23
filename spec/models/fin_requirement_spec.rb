RSpec.describe FinRequirement, type: :model do
  subject(:fin_requirement) { create :fin_requirement }
  
  context 'association' do
    it { should belong_to :country }
  end
  
  context 'validation' do
    it { should validate_presence_of(:cost) }
  end
end
