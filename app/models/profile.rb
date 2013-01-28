##
# Profiles hold information related to the user that are not related
# to authentication.
#
class Profile < ActiveRecord::Base
  attr_accessible :description, :gender, :name

  belongs_to :user
end
