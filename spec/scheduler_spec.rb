require 'spec_helper'
require 'scheduler'

describe Scheduler do
  it "should compute schedule and validate as false" do
    camp_array = ["archery", "swimming", "swimming", "crafts", "archery", "archery", "crafts"]
    schedule = Scheduler.new(camp_array)
    expected = [
      ["archery", 1],
      ["swimming", 2],
      ["crafts", 1],
      ["archery", 2],
      ["crafts", 1],
    ]
    expect(schedule.compute).to eq expected
    expect(schedule.validate).to eq false

  end

  it "should compute schedule and validate as true" do
    camp_array = ["archery", "archery", "swimming", "swimming", "crafts", "crafts", "archery", "archery", "crafts"]
    schedule = Scheduler.new(camp_array)
    expected = [
      ["archery", 2],
      ["swimming", 2],
      ["crafts", 2],
      ["archery", 2],
      ["crafts", 1],
    ]
    expect(schedule.compute).to eq expected
    expect(schedule.validate).to eq true
  end

  it "should compute schedule and validate as true" do
    camp_array = ["archery", "archery", "swimming", "swimming", "swimming", "archery", "archery", "crafts"]
    schedule = Scheduler.new(camp_array)
    expected = [
      ["archery", 2],
      ["swimming", 3],
      ["archery", 2],
      ["crafts", 1],
    ]
    expect(schedule.compute).to eq expected
    expect(schedule.validate).to eq true
  end

end