
# require 'bundler/gem_tasks'
# begin
#   Bundler.setup
# rescue Bundler::BundlerError => e
#   $stderr.puts e.message
#   $stderr.puts 'Run `bundle install` to install missing gems'
#   exit e.status_code
# end

require 'rake/testtask'
desc 'Run test group 0'
Rake::TestTask.new('test:example') do |task|
  task.test_files = FileList[
  'measures/plug_load_controls/tests/plug_load_controls_test.rb',
  ]
end

# require 'rake/testtask'
# desc 'Run all measure tests'
# Rake::TestTask.new('test:allofem') do |task|
#   task.libs << 'test'
#   task.test_files = FileList['measures/*/test/test_*.rb']
# end

require 'rubocop/rake_task'
desc 'Check the code for style consistency'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = ['--no-color', '--out=rubocop-results.xml']
  task.formatters = ['RuboCop::Formatter::CheckstyleFormatter']
  task.requires = ['rubocop/formatter/checkstyle_formatter']
  # don't abort rake on failure
  task.fail_on_error = false
end
