class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, [City, User, Topic]
    if user.persisted?
      can :create, [Favorite, Topic, Comment, Rating]
      if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, [Region, Country, City, User, Topic, Comment, Rating, Favorite]
      end
    end
  end
end
