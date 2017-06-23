RSpec.describe User, type: :model do
  subject(:user) { create :user }
  
  context 'association' do
    it { should have_many :favorite }
    it { should have_many :topic }
  end
end
