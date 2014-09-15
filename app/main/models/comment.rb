class Comment < Model
  validate :_name, presence: true
end