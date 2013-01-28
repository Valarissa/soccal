class Page < Commentable

  key   :title, String
  key   :body

  many  :media
end
