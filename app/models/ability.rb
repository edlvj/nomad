class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, [Country, City]
    if user.persisted?
      can :update, [User]
      if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, [Country, City, User]
      end
    end
  end
end
