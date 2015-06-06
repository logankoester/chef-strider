guard 'foodcritic', cli: '--epic-fail any', cookbook_paths: '.' do
  watch(/.*\.rb/)
  watch(/.*\.erb/)
end

guard 'rspec', cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+})
  watch(%r{^recipes/(.+)\.rb$})
  watch(%r{^attributes/(.+)\.rb$})
  watch(%r{^files/(.+)})
  watch(%r{^templates/(.+)})
  watch(%r{^providers/(.+)\.rb})
  watch(%r{^resources/(.+)\.rb})
end

# rubocop:disable RegexpLiteral
guard 'kitchen' do
  watch(%r{test/.+})
  watch(%r{^recipes/(.+)\.rb$})
  watch(%r{^attributes/(.+)\.rb$})
  watch(%r{^files/(.+)})
  watch(%r{^templates/(.+)})
  watch(%r{^providers/(.+)\.rb})
  watch(%r{^resources/(.+)\.rb})
end
# rubocop:enable RegexpLiteral
