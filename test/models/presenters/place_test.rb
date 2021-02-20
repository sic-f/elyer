require 'test_helper'
require 'support/attachments_helper'

class Presenters::PlaceTest < ActiveSupport::TestCase
  include AttachmentsHelper

  test '#reviewer_thumbnail' do
    user = create :user
    user.avatar.attach local_file

    presenter = Presenters::Place.new

    assert_instance_of ActiveStorage::VariantWithRecord,
                       presenter.reviewer_thumbnail(user.avatar)
  end
end
