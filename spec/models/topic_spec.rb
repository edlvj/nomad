RSpec.describe Topic, type: :model do
  subject(:topic) { create :topic }
  
  context 'association' do
    it { should belong_to :city }
    it { should belong_to :user }
    it { should have_many :comments }
  end
  
  context 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end
end
