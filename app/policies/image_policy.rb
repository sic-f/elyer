class ImagePolicy < ApplicationPolicy
  def edit?
    record.user.eql? user
  end

  def update?
    record.user.eql? user
  end
end
