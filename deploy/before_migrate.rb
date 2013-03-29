#Chef::Log.info("Running deploy/before_migrate.rb...")
#
#Chef::Log.info("Symlinking #{release_path}/public/assets to #{new_resource.deploy_to}/shared/assets")
#
#link "#{release_path}/public/assets" do
#  to "#{new_resource.deploy_to}/shared/assets"
#end
#
#rails_env = new_resource.environment["RAILS_ENV"]
#Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
#
#execute "rake assets:precompile" do
#  cwd release_path
#  command "bundle exec rake assets:precompile"
#  environment "RAILS_ENV" => rails_env
#end

# NOTE: above results in:
# unicorn/configurator.rb:600:in `parse_rackup_file': rackup file (production) not readable (ArgumentError)


# trying again WITHOUT symlinking public/assets to shared/assets
Chef::Log.info("Running deploy/before_migrate.rb...")

rails_env = new_resource.environment["RAILS_ENV"]
Chef::Log.info("Precompiling assets for #{rails_env}...")

current_release = release_path

execute "rake assets:precompile" do
  cwd current_release
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => rails_env
end
