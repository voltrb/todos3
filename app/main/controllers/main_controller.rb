class MainController < Volt::ModelController
  model :page

  def todos
    self.model = :store
  end

  def options
    vals = page._opts.to_s.or('').split(/,/)

    return vals
  end

  def percent_complete
    return ((completed.or(0) / _todos.size.to_f) * 100.0).round
  end

  def completed
    _todos.count {|v| v._complete.true? }
  end

  def current_todo
    _todos[params._index.or(0).to_i]
  end

  def all_complete
    completed == _todos.size
  end

  def add_todo
    self._todos << page._new_todo
    page._new_todo = {}
  end

  def check_all
    _todos.each do |todo|
      todo._complete = true
    end
  end

  def collections
    # Create an empty item to test things with
    store._items.then do
      if store._items.size == 0
        store._items << {_name: ''}
      end
    end
  end

  def meal_cost
    self._meal_cost = 20
    self._number_of_people = 2
  end

  def person_share
    _meal_cost.to_f / _number_of_people.or(1).to_i
  end

  private
    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      params._controller.or('main') + "/" + params._action.or('index')
    end
end
