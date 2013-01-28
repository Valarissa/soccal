##
# Through this class, all objects capable of being moderated can interact with
# all objects capable of moderating/viewing. Groups can be anything from
# FriendGroups to Calendars. This object is effectively what controls all
# authorizations of actions.
#
class Membership < ActiveRecord::Base
  attr_accessible :member_id, :member_type, :role_id, :group_id, :group_type

  belongs_to :member, :polymorphic => true
  belongs_to :group,  :polymorphic => true
  belongs_to :role
end
