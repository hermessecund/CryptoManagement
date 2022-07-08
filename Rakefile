require 'rake/testtask'

task default: %w[install]

task :test do
  ENV['COVERAGE'] = 'FALSE'
  Rake::Task['UnitTestsPortFolio'].invoke
  Rake::Task['UnitTestsCoin'].invoke
  Rake::Task['UnitTestsPortfolioManager'].invoke
  Rake::Task['OperationParser'].invoke
  Rake::Task['Dator'].invoke
end

desc 'Install all dependencies'
task :install do
  exec 'bundle install'
end

Rake::TestTask.new do |t|
  ENV['COVERAGE'] = 'TRUE'
  t.name = 'coverage'
  t.pattern = 'test/**/*Test.rb'
end

Rake::TestTask.new do |t|
  t.name = 'UnitTestsPortFolio'
  t.test_files = FileList['test/PortfolioTest.rb']
end

Rake::TestTask.new do |t|
  t.name = 'UnitTestsCoin'
  t.test_files = FileList['test/CoinTest.rb']
end

Rake::TestTask.new do |t|
  t.name = 'UnitTestsPortfolioManager'
  t.test_files = FileList['test/PortfolioManagerTest.rb']
end

Rake::TestTask.new do |t|
  t.name = 'OperationParser'
  t.test_files = FileList['test/Parser/OperationParserTest.rb']
end

Rake::TestTask.new do |t|
  t.name = 'Dator'
  t.test_files = FileList['test/DataAccess/DatorTest.rb']
end
