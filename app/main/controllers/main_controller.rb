class MainController < ModelController
  def todos
    self.model = :store
    self._current_todo = _todos[params._index.to_i]
    self._completed = _todos.count {|v| v._complete }
    self._percent_complete = ((_completed / _todos.size.to_f) * 100.0).round

    params._index.on('changed') { puts "INDEX CHANGED" }
  end

  def add_todo
    self._todos << page._new_todo.cur
    page._new_todo = {}
  end

  def check_all
    _todos.each do |todo|
      todo._complete = true
    end
  end

  def collections
    store._items.then do
      if store._items.size == 0
        store._items << {_name: ''}
      end
    end
  end

  def meal_cost
    self._meal_cost = 20
    self._number_of_people = 2
    self._person_share = _meal_cost.to_f / _number_of_people.or(1).to_i
  end

  private
    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      params._controller.or('main') + "/" + params._action.or('index')
    end
end
