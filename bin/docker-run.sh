#!/bin/bash

export CI=true
export CIRCLECI=true
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

ruby -ropenstudio -e 'require "openstudio"; puts OpenStudio.openStudioLongVersion'
# test crap
#echo eval "$(cd "$(ruby -e "puts File.join(ENV[:CIRCLE_ARTIFACTS.to_s], :coveralls.to_s)")" && ls -al)"

# Run a specific set of tests on each node.
# Test groups are defined in the Rakefile.
# Each group must have a total runtime less
# than 2 hrs.

cd /measure_qa

# install dependencies for the docker portion
bundle install

rake test:example2
#bundle exec rake run_rubocop

# test crap
#echo eval "$(cd "$(ruby -e "puts File.join(ENV[:CIRCLE_ARTIFACTS.to_s], :coveralls.to_s)")" && ls -al)"

# case $CIRCLE_NODE_INDEX in
#   0)
#     rake test:example2
#     #rake test:rubocop
#     #rake test:gem_group_0
#    ;;
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
#esac
    
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
