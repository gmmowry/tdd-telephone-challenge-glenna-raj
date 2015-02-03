
require "rspec"
require_relative "task"
require_relative "list"


describe Task do

  let (:title) { "Wash stuffed animals" }
  let (:description) { "wash Snuggles, he smells" }
  let (:task) { Task.new(title, description, status, created_at) }

  context '#initialize' do
    it "creates a task object" do
      expect(task).to be_an_instance of Task
    end

    it "requires two parameters" do
      expect { Task.new }. to raise_error(ArgumentError)
    end

    it "initializes with a created_at timestamp" do
      expect(task.created_at).to be_an_instance of Datetime
    end

    it "initializes with status incomplete as default" do
      expect(task.status).to eq("incomplete")
    end
  end

  context "#mark_as_complete!" do
    it "changes the status to complete" do
      expect(task.status).to change{task.status}.from("incomplete").to("complete")
    end
  end

  context "#mark_as_incomplete!" do
    it "changes the status to incomplete" do
      expect(task.status).to change{task.status}.from("complete").to("incomplete")
    end
  end

  context "#complete?" do
    it "checks the status of a task" do
      expect(task.complete?).to be_complete
    end
  end
end


describe List do
  let(:title) { "Get Shit Done" }
  let(:list) { List.new(title) }
  let (:task) { Task.new("wash Snuggles", "Wash that damn stuffed animal") }
  let (:new_task) { Task.new("Make the bed", "clean your sheets and put new ones on the bed") }
  let (:done_task) { Task.new("Clean the Kitchen", "Burn the counters clean with fire", status: "complete") }

  context "#initialize" do
    it "creates a list object" do
      expect(list).to be_an_instance of List
    end

    it "expects one argument" do
      expect{ List.new }.to raise_error(ArgumentError)
    end
  end

  context "#add_task(task)" do
    it "takes one argument" do
      expect { list.add_task }.to raise_error(ArgumentError)
    end

    it "adds a task object to the tasks array" do
      expect(list.add_task(done_task)).to change{list.tasks.length}.from(0).to(1)
    end
  end

  context "#complete?" do
    it "returns true when all tasks on a list are status complete" do
      list.add_task(done_task)
      expect(list.complete?).to be_complete
    end
  end

  context "#complete_all" do
    it "marks all of the tasks as complete" do
      list.tasks.each { |task| task.mark_as_complete }
      expect(list.complete?).to be_complete
    end
  end

  context "#completed_tasks" do
    it "returns an empty array when all tasks are incomplete" do
      expect(list.completed_tasks).to eq([])
    end

    it "returns an array of tasks with status complete" do
      list.add_task(task)
      list.add_task(new_task)
      list.add_task(done_task)
      expect(list.completed_tasks.length).to eq(1)
    end
  end

  context "#incomplete_tasks" do
    it "returns an empty array when all tasks are complete" do
      list.complete_all
      expect(list.incomplete_tasks).to eq([])
    end

    it "returns an array of tasks with status complete" do
      list.add_task(task)
      list.add_task(new_task)
      list.add_task(done_task)
      expect(list.incomplete_tasks.length).to eq(2)
    end
  end
end

