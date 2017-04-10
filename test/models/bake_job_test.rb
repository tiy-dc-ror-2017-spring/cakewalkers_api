require "test_helper"

class BakeJobTest < ActiveSupport::TestCase
  test "when back job is done it update state will progress" do
    job = BakeJob.create(product: Product.first)

    assert_equal job.state, "waiting"
    job.update_current_state
    assert_equal job.state, "baking"

    Timecop.travel(1.hour) do
      job.update_current_state
      assert_equal job.state, "done"
    end
  end

  test "overfilled oven" do
    BakeJob.create(product: Product.first)
    BakeJob.create(product: Product.first)
    BakeJob.create(product: Product.first)

    # Start the ovens
    BakeJob.update_all_states

    BakeJob.create(product: Product.first)

    refute BakeJob.baking_capacity, "there was baking capacity where its maxed out"

    Timecop.travel(1.hour) do
      BakeJob.update_all_states
      assert BakeJob.baking_capacity
      assert_equal BakeJob.number_of_baking_items, 1
    end
  end
end
