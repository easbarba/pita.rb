require_relative 'config/application'

Rails.application.load_tasks

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rails'
end

# default
task default: :spec
