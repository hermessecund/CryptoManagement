require "rake/testtask"

task default: %w[install]

task :test do
	ENV["COVERAGE"]='FALSE'
	Rake::Task["UnitTestsPortFolio"].invoke
	Rake::Task["UnitTestsCoin"].invoke
	Rake::Task["UnitTestsPortfolioManager"].invoke
end

desc "Install all dependencies"
task :install do
	exec "bundle install"
end

Rake::TestTask.new do |t|
	ENV["COVERAGE"]='TRUE'
	t.name = "coverage"
	t.pattern = "test/**/*Test.rb"     # This expects your tests to be inside a test subfolder
end 

Rake::TestTask.new do |t|
	t.name = "UnitTestsPortFolio"
	t.test_files = FileList['test/PortfolioTest.rb']
end

Rake::TestTask.new do |t|
	t.name = "UnitTestsCoin"
	t.test_files = FileList['test/CoinTest.rb']
end

Rake::TestTask.new do |t|
	t.name = "UnitTestsPortfolioManager"
	t.test_files = FileList['test/PortfolioManagerTest.rb']
end