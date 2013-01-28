##
# Class to handle aggregation of various shared content, such as Comments,
# Pictures, Videos, SoundClips and the like.
#
class Medium < ActiveRecord::Base
  attr_accessible :shareable_id, :shareable_type, :target_id, :target_type

  belongs_to :target, :polymorphic => true
  belongs_to :shareable, :polymorphic => true
end
