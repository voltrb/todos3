class CommentsController < ModelController
  def index
    self.model = data.comment
  end

  def new
    puts "Data.Post: #{data.post._comments.buffer.inspect}"
    self.model = data.post._comments.buffer
  end

  def add_comment
    if save!
      new
    end
  end
end
