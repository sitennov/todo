class Task < ApplicationRecord
  PRIORITIES = [
    ['later', 1],
    ['next', 2],
    ['now', 3]
  ]

  def complete!
    self.completed = true
    save
  end
end
