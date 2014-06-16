class Scheduler
  def initialize(plans)
    @plans = plans
  end

  def compute
    plan_iterations = []
    current_plan = [nil, nil]
    @plans.each_with_index do |plan, index|

      if index == 0
        current_plan = [plan, 1]
      elsif plan != current_plan[0]
        plan_iterations << current_plan
        current_count = 1
        current_plan = [plan, 1]
      else
        current_plan[1] += 1
      end
      if index == @plans.length-1
        plan_iterations << current_plan
      end
    end
    plan_iterations
  end

  def validate
    computed_schedule = compute
    is_valid = true
    computed_schedule.each_with_index do |activity, index|
      if (activity[1] < 2) && index != computed_schedule.length-1
        is_valid = false
      end
    end
    is_valid

  end
end