class BlogController < ModelController
  def index
    self.model = :store
  end

  def show
    result = store._posts.find(_id: params._id)

    self.model = result
  end

  def new
    self.model = store._posts.buffer
  end

  def edit
    store._posts.find(_id: params._id).then do |result|
      self.model = result[0].buffer
    end
  end

  def save
    res = model.save!.then do
      go '/blog'
    end
  end
end
