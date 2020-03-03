# frozen_string_literal: true

require 'foodcritic'
require 'rubocop/rake_task'

FoodCritic::Rake::LintTask.new do |t|
  t.options = { fail_tags: ['any'] }
end

RuboCop::RakeTask.new

task test: %i[foodcritic rubocop]
task default: %i[test]
