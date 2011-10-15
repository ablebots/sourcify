require 'bundler'
Bundler::GemHelper.install_tasks

desc "Run all specs"
task :spec do
  system %(bacon spec/*/*_spec.rb)
end

desc "Run only proc specs"
task :'spec:proc' do
  system %(bacon spec/proc/*_spec.rb)
end

desc "Run only method specs"
task :'spec:method' do
  system %(bacon spec/method/*_spec.rb)
end
