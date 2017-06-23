require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject(:rating) { create :rating }
  
  context 'association' do
    it { should belong_to :city }
  end
end
