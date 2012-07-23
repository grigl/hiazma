require "rvm/capistrano"
require "bundler/capistrano"

set :application, "hiazma"

set :rvm_ruby_string, "1.9.3@hiazma"
set :repository,  "git@github.com:whitescape/hiazma.git"
set :scm, :git
set :branch, "master"

server "hiazma.com", :app, :web, :db, :primary => true
set :user, "rails"
set :deploy_to, "/home/rails/apps/hiazma"


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end