#!/bin/bash

export CI=true
export CIRCLECI=true
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Run a specific set of tests on each node.
# Test groups are defined in the Rakefile.
# Each group must have a total runtime less
# than 2 hrs.
cd /measure_qa
echo "RUBYLIB = $RUBYLIB"

gem install bundler # testing...

# bundle install
bundle exec rake test:example
bundle exec rake rubocop

# require 'simplecov'

# # save to CircleCI's artifacts directory if we're on CircleCI
# if ENV['CIRCLE_ARTIFACTS']
#   dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
#   SimpleCov.coverage_dir(dir)
# end

# SimpleCov.start


# case $CIRCLE_NODE_INDEX in
#   0)
#     rake test:example
#     #rake test:rubocop
#     #rake test:gem_group_0
#     ;;
#   1)
#     rake test:gem_group_1
#     ;;
#   2)
#     rake test:gem_group_2
#     ;;
#   3)
#     rake test:gem_group_3
#     ;;
#   *)
# esac
    
# Loop through the test files and run
# every nth test, where n is determined
# by the total number of CI nodes and
# the index of this particular node.
# Note: this command is running
# ON EACH NODE.
# i=0
# files=()
# for testfile in $(find test/ -name "test_*.rb" | sort); do
  # if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
  # then
    # ruby $testfile
  # fi
  # ((i=i+1))
# done
