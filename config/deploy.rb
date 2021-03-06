# frozen_string_literal: true

set :application, "nipanipa"

set :repo_url, "git@github.com:deivid-rodriguez/nipanipa.git"
set :branch, -> { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/deployer/nipanipa"

set :log_level, :debug
set :pty, true

set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets public/uploads]

set :keep_releases, 5

set :bundle_without, "deploy development test tools"

set :passenger_restart_with_touch, false
