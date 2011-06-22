# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "nova.isfit.org"
role :web, "nova.isfit.org"
role :app, "nova.isfit.org"
role :db, "nova.isfit.org", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/srv/www/core.isfit.org"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :subversion
set :scm_username, "passenger"
set :repository, "file:///var/svn/isfit-core"
#set :branch, "master"
#set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "chmod -R 775 #{release_path}"
    # run "ln -nfs #{shared_path}/images/users #{release_path}/public/images/users"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
