require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Upload Model" do
  it 'can construct a new instance' do
    @upload = Upload.new
    refute_nil @upload
  end
end
