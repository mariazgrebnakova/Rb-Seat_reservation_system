class Ability
  include CanCan::Ability

  def initialize(user)

    current_user_id = user.id
    if user.is_admin?
      can :manage, :all

    elsif user.user_type.name == 'Manager'
      can :invite, User
      can [:edit, :delete], Reservation, {seat: {department_id: user.department_id}}
      can :read, :all

    else
      can :read, User
      can :read, Department
      can :read, Seat
      can [:read, :create], Reservation
      can [:edit, :delete], Reservation, user_id: current_user_id
    end
  end
end
