require 'thinking_sphinx/deploy/capistrano'

set :user, Proc.new { Capistrano::CLI.ui.ask("Enter user name: ") }
set :domain, 'whowoulddowhich.com'
set :application, 'wwnd'

set :repository,  "git://github.com/jlcapps/#{application}.git" 
set :deploy_to, "/home/#{user}/webapps/rails/#{domain}" 
set :current_config_path, "#{current_path}/config"
set :copy_path, "#{deploy_to}/to_copy"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :git_shallow_clone, 1

after 'deploy:symlink', 'deploy:finishing_touches'

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end

  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end
  task :finishing_touches, :roles => :app do
    run "cp -pf #{copy_path}/database.yml #{current_config_path}/database.yml"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
after "deploy:setup", "thinking_sphinx:shared_sphinx_folder"
