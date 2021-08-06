# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    end

    alias_action(:create, :read, :update, :delete, to: :crud)

    can :crud, Course do |course|
      user==course.user
    end

    can(:enroll, Course) do |course|
      user.persisted?
    end

    can(:destroy, Enroll) do |enroll|
      enroll.user == user
    end
  end
end
