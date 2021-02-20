require 'test_helper'
require 'support/attachments_helper'

class Presenters::PlaceTest < ActiveSupport::TestCase
  include AttachmentsHelper

  test '#reviewer_thumbnail returns active storage variant' do
    user = create :user
    user.avatar.attach local_file

    presenter = Presenters::Place.new

    assert_instance_of ActiveStorage::VariantWithRecord,
                       presenter.reviewer_thumbnail(user.avatar)
  end

  test '#reviewer_thumbnail returns string when reviewer has no avatar' do
    user = create :user

    presenter = Presenters::Place.new

    assert_instance_of String,
                       presenter.reviewer_thumbnail(user.avatar)
  end
end
