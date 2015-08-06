class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    elsif user.applicant?
        # can [:create], Submission do |s|
        #     user.abstractless? and !user.ticketless?
        # end
        can :show, Webpage
        can [:read], Submission do |s|
            s.user_id == user.id
        end
        cannot [:index, :edit, :update], Submission
        can [:edit, :update], Submission do |s|
            s.user_id == user.id and s.editable == true
        end
        can [:main, :show], Workshop
        can [:listall, :register], Workshop do |w|
            user.ticketless?
        end
    elsif user.reviewer?
        can [:update], Review do |r|
            r.user_id = user.id and !r.finalized
        end
        can [:show], Review do |r|
            r.user_id = user.id
        end
        can [:main], Workshop
    elsif user.resourceperson?
        can :show, Webpage
        can [:update], Workshop, :workshopconductorship => {:user_id => user.id}
        can [:listall, :main, :show], Workshop
    else
        can :show, :all
        can :show, Submission do |s|
            s.final_status == 'talk' or s.final_status == 'poster'
        end
        can [:main], Workshop
    end
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
  end
end
