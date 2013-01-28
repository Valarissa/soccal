##
# This object is what handles all authentications. It is distinctly
# separate from the Profile which is a user's public representation of
# themselves.
#
# To clarify, this class handles all login information and the Profile
# handles a user's fluff.
#
class User < ActiveRecord::Base
  attr_accessible :email, :hash_auth

  has_one :profile
  has_many :memberships, :as => :member
end
