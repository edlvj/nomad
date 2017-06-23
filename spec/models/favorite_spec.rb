RSpec.describe Favorite, type: :model do
  subject(:favorite) { create :favorite }
  
  context 'association' do
    it { should belong_to :city }
    it { should belong_to :user }
  end
end
