class CommentPolicy < ApplicationPolicy
  def edit?
    record.user.eql? user
  end

  def update?
    record.user.eql? user
  end

  def destroy?
    record.user.eql? user
  end
end
