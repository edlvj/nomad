RSpec.describe City, type: :model do
  subject(:city) { create :city }
  
  context 'association' do
    it { should belong_to :country }
    it { should have_many(:topic) }
    it { should have_one(:rating) }
  end
  
  context 'validation' do
    it { should validate_presence_of(:title) }
  end
end
