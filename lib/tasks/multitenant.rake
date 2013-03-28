db_tasks = %w[db:migrate db:migrate:up db:migrate:down db:rollback db:forward]

namespace :multitenant do
  db_tasks.each do |task_name|
    desc "Run #{task_name} for each tenant"
    task task_name => %w[environment db:load_config] do
      DealerGroup.find_each do |dealer_group|
        puts "Running #{task_name} for #{dealer_group.subdomain}"
        dealer_group.scope_schema { Rake::Task[task_name].execute }
      end
    end
  end
end

db_tasks.each do |task_name|
  # Rake::Task[task_name].enhance(["multitenant:#{task_name}"])
end
