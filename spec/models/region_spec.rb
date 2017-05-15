RSpec.describe Region, type: :model do
  context 'validation' do
    it { should validate_presence_of(:title) }
  end
end
