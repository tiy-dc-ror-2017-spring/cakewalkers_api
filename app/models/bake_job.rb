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

  def number_of_baking_items
    self.class.where(state: :baking).count
  end

  def baking_capcity
    number_of_baking_items < OVENS
  end

  def completion_time
    started_at + estimated_time_to_completion_in_seconds.seconds
  end

  def update_current_state
    if baking? &&completion_time < Time.current && baking_capcity
      update(state: :done, completed_at: Time.current)
    elsif baking_capcity
      update(state: :baking, started_at: Time.current) unless baking?
    end
  end
end
