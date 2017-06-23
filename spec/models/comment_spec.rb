RSpec.describe Comment, type: :model do
  subject(:comment) { create :comment }
  
  context 'association' do
    it { should belong_to :user }
    it { should belong_to :topic }
  end
end
