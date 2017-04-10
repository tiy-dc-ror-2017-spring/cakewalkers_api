class BakeJob < ApplicationRecord
  belongs_to :product
  enum state: {
    waiting: 0,
    baking: 1,
    done: 2
  }

  OVENS = 3

  before_save :fake_time_for_item, on: :create
  # LOL
  def fake_time_for_item
    seconds_to_complete = product.time_to_bake_in_seconds + rand(1000)
    self[:estimated_time_to_completion_in_seconds] = seconds_to_complete
  end

  def completion_time
    started_at + estimated_time_to_completion_in_seconds.seconds
  end

  def update_current_state
    if baking? && completion_time < Time.current
      update(state: :done, completed_at: Time.current)
    elsif self.class.baking_capacity
      update(state: :baking, started_at: Time.current) unless baking?
    end
  end

  class << self
    def update_all_states
      all.map(&:update_current_state)
    end

    def number_of_baking_items
      where(state: :baking).count
    end

    def baking_capacity
      number_of_baking_items < OVENS
    end
  end
end
