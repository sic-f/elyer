class CommentPolicy < ApplicationPolicy
  def destroy?
    record.user.eql? user
  end
end
