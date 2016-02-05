class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    dataset.insert(task)
  end

  def all
    dataset.to_a.map { |data| Task.new(data) }
  end

  def dataset
    database.from(:tasks)
  end

  def find(id)
    Task.new(dataset.where(:id => id).to_a.first)
  end

  def update(task, id)
    dataset.where(:id => id).update(:title => task[:title], :description => task[:description])
  end

  def delete(id)
    dataset.where(:id => id).delete
  end
end
