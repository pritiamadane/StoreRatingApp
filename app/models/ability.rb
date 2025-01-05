class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'store_owner'
      can :manage, Store, user_id: user.id
      can :read, Rating, store: { user_id: user.id }
    else
      can :read, Store
      can :create, Rating
      can :update, Rating, user_id: user.id
    end
  end
end