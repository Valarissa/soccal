class Comment
  include MongoMapper::Document

  key :text
  belongs_to :commentable
end
