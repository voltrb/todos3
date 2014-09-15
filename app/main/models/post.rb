class Post < Model
  validate :_title, length: 5
  validate :_body, length: 20
end