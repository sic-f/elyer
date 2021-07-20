class ReviewPolicy < ApplicationPolicy
  def edit?
    record.reviewer.eql? user
  end

  def update?
    record.reviewer.eql? user
  end

  def destroy?
    record.reviewer.eql? user
  end
end
