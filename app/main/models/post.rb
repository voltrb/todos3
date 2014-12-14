class Post < Volt::Model
  validate :title, length: 5
  validate :body, length: 20
end