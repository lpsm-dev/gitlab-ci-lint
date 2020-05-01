#!/bin/sh

set -e
cd $(dirname "$0")/..

gem_name=gitlab

echo -e "\nRemove old gem releases."
rm -rf $gem_name-*.gem

echo -e "\nBuild a new gem release."
gem build -q $gem_name.gemspec

echo -e "\nInstall gem."
gem install $gem_name-*.gem

echo -e "Push gem."
gem push $gem_name-*.gem
