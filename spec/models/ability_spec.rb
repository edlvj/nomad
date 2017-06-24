require 'cancan/matchers'

describe User, type: :model do
  let(:user) { create :user }
  let(:admin) { create :user, :admin }
  
  context 'when user no logged' do
    subject { Ability.new(nil) }
    [City, User, Topic, Rating].each do |model_name|
      it { should be_able_to(:read, model_name.new) }
    end
  end
  
  context 'when user signed in' do
    subject { Ability.new(user) }
    
    [Favorite, Topic, Comment].each do |model_name|
      it { should be_able_to(:create, model_name.new) }
    end
  end
  
  context 'when user as admin' do
    subject { Ability.new(admin) }
    [Region, Country, City, User, Topic, Comment, Rating, Favorite].each do |model_name|
      it { should be_able_to(:manage, model_name.new) }
    end
  end  
end  