class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, [City, User, Topic]
    can :create, Rating
    if user.persisted?
      can :create, [Favorite, Topic, Comment]
      if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, [Region, Country, City, User, Topic, Comment, Rating, Favorite]
      end
    end
  end
end
