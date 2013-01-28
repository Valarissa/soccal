##
# The role is used by the Membership class to determine what type of
# permissions a membership holds.
#
class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :memberships
end
