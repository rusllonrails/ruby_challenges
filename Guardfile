guard :shell do
  watch(%r{^challenges/(.*)$}) do |modified_files|
    file_path = modified_files[0]

    p ""
    p "*" * 100
    p "[Running] #{file_path}"
    p ""

    # 1: Run ruby class
    `ruby #{file_path}`

    # 2: Then run Rspec test related
    spec_name = file_path.gsub('challenges', '')
                         .gsub('.rb', '_spec.rb')
    `bundle exec rspec spec/unit/#{spec_name}`
  end
end
