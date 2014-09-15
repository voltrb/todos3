class CommentsController < ModelController
  def index
    self.model = @comment
  end

  def new
    self.model = @post._comments.buffer
  end

  def add_comment
    if save!
      new
    end
  end
end
