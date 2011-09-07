# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2-p290'
set :rvm_type, :user


# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "core.isfit.org"
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
set :scm, :git
set :scm_username, "passenger"
set :repository, "git@github.com:isfit/isfit-core.git"
set :branch, "3.1-test"

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



desc "remotely console"
task :console, :roles => :app do
  input = ''
  run "cd #{current_path} && rails console production" do |channel, stream, data|
    next if data.chomp == input.chomp || data.chomp == ''
    print data
    channel.send_data(input = $stdin.gets) if data =~ /:\d{3}:\d+(\*|>)/
  end
end
