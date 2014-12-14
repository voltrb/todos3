class Comment < Volt::Model
  validate :name, presence: true
  # validate :_body, length: 20
end