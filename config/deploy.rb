set :application, "hiazma"

set :rvm_ruby_string, '1.9.3@hiazma'
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
require "rvm/capistrano"
require "bundler/capistrano"
set :bundle_dir, '/home/rails/.rvm/gems/ruby-1.9.3-p194@hiazma/gems'

set :repository,  "git@github.com:whitescape/hiazma.git"
set :scm, :git
set :branch, "master"

server "hiazma.com", :app, :web, :db, :primary => true
set :user, "rails"
set :deploy_to, "/home/rails/apps/hiazma"

set :unicorn_binary, "unicorn"
set(:unicorn_pid) {"#{current_path}/tmp/pids/unicorn.pid"}
set :unicorn_config, "/home/rails/unicorns/hiazma.rb"

before 'deploy:restart', 'deploy:migrate'
after 'deploy:restart', 'unicorn:restart'
after 'deploy:update_code', 'deploy:symlink_uploads'
after 'deploy:finalize_update', 'deploy:symlink_configs'

after "deploy:setup" do
  run "mkdir -p #{deploy_to}/shared/pids && mkdir -p #{deploy_to}/shared/config && mkdir -p #{deploy_to}/shared/var && mkdir -p #{deploy_to}/shared/uploads"
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

namespace :deploy do
   task :symlink_uploads do
     run <<-CMD
      rm -rf #{latest_release}/public/uploads &&
      ln -s #{shared_path}/uploads #{latest_release}/public/uploads
    CMD
  end
  task :symlink_configs do
    run "ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
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