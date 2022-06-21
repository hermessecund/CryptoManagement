require "rake/testtask"

task default: %w[install]
task test: %w[UnitTestsPortFolio UnitTestsCoin]

desc "Install all dependencies"
task :install do
	exec "bundle install"
end

Rake::TestTask.new do |t|
	t.name = "UnitTestsPortFolio"
	t.test_files = FileList['test/PortfolioTest.rb']
end

Rake::TestTask.new do |t|
	t.name = "UnitTestsCoin"
	t.test_files = FileList['test/CoinTest.rb']
end