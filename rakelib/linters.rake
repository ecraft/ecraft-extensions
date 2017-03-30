desc 'Runs the linters'
task :linters do
  rubocop_passed = system 'bundle exec rubocop'
  raise 'Error running Rubocop and/or CoffeeLint' unless rubocop_passed
end
