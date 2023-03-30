#!/usr/bin/env bash
# exit on error
set -o errexit

# bundle exec rake assets:precompile
# bundle exec rake assets:clean
bundle install
bundle exec rake db:migrate --trace
bundle exec rake db:seed