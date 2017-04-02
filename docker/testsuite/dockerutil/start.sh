#!/bin/bash

cd /automated
bundle install

pwd
ls -la
cat Gemfile.loc

FEATURE="$(echo $1 | sed 's/\,/ /g')"

bundle exec cucumber $FEATURE
