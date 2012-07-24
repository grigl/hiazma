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

set :unicorn_binary, "unicorn"
set(:unicorn_pid) {"#{current_path}/tmp/pids/unicorn.pid"}
set :unicorn_config, "/home/rails/unicorns/hiazma.rb"
after 'deploy:restart', 'unicorn:restart'

after "deploy:setup" do
  run "mkdir -p #{deploy_to}/shared/pids && mkdir -p #{deploy_to}/shared/config && mkdir -p #{deploy_to}/shared/var"
end

namespace :unicorn do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "#{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D #{current_path}/config.ru"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill `cat #{unicorn_pid}` && true"
    start
  end
end

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