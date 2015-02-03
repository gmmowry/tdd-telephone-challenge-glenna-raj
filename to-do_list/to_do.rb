require 'date'

class Task
  attr_accessor :title, :description, :status
  attr_reader :created_at

  def initialize(title, description, status = "incomplete")
    @title = title
    @description = description
    @status = status
    @created_at = DateTime.now
  end

  def mark_as_complete!
    @status = "complete"
  end

  def mark_as_incomplete!
    @status = "incomplete"
  end

  def complete?
    @status == "complete"
  end

end

class List
  attr_accessor :title
  attr_reader :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    @tasks << task
  end

  def complete?
    @tasks.all? { |task| task.complete? }
  end

  def complete_all!
    @tasks.each { |task| task.mark_as_complete! }
  end

  def completed_tasks
    @tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    @tasks.select { |task| !task.complete? }
  end
end
