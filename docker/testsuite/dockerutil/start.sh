#!/bin/bash

cd /automated

FEATURE="$(echo $1 | sed 's/\,/ /g')"

bundle exec cucumber $FEATURE
