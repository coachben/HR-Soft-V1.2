class Ability
  include CanCan::Ability

  def initialize(user)
  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    # These are the only roles we can use in our application
    #current_user.superadmin_role?
    #current_user.supervisor_role?
    #current_user.user_role?
    

    user ||= User.new # guest user (not logged in)
    
    if user.superadmin_role?
      can :manage, :all
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      #can :dashboard                  # allow access to dashboard
    end
    if user.supervisor_role?
      can :manage, User
    end
    
    if user.user_role?
      #can :update, Product, hidden: false  # allow sales to only update visible products
      can :read, Worker #User can see fellow workers
    end

    
  end
end
