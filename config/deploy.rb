#load "deploy/assets" # Automatically precompile assets
#require "bundler/capistrano" # Execute "bundle install" after deploy, but only when really needed
#require "rvm/capistrano" # RVM integration

default_run_options[:pty] = true  # Must be set for the password prompt

set :application, "finance"
set :rails_env, :production # Application environment
set :repository,  "."
set :scm, :none
set :deploy_via, :copy
set :checkout, 'export'

set :user, 'nixserver' # Your username goes here
set :use_sudo, false  # We don't want to use sudo (root) - for security reasons
set :domain, 'nixserver.local' # Your domain goes here
set :application_dir, "/Users/#{user}/Sites/#{application}"
set :deploy_to, application_dir

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

set :chmod755, "app config db lib public vendor script script/* public/disp*"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{ try_sudo } touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
