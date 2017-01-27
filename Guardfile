guard :rspec, cmd: "bundle exec rspec" do
  watch(/^lib\/annoyme\/(.*)\.rb/) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/(.+)\.rb$})
end
