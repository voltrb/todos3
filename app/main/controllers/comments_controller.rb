class CommentsController < Volt::ModelController
  def index
    self.model = attrs.comment
  end

  def new
    self.model = attrs.post._comments.buffer
  end

  def add_comment
    if model.save!
      new
    end
  end
end
