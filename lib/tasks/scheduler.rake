  desc "Purge daily tasks"
  task purge_daily: :environment do
    tasks = Task.where(frequency: "Daily")
    tasks.each do |task|
      task.update_attributes(completed: false)
    end
  end

  desc "Purge weekly tasks"
  task purge_weekly: :environment do
    require 'time'
    t = Time.now
    if t.monday?
      tasks = Task.where(frequency: "Weekly")
      tasks.each do |task|
        task.update_attributes(completed: false)
      end
    end
  end

  desc "Purge monthly tasks"
  task purge_monthly: :environment do
    require 'time'
    t = Time.now
    if t.day == 1
      tasks = Task.where(frequency: "Monthly")
      tasks.each do |task|
        task.update_attributes(completed: false)
      end
    end
  end
