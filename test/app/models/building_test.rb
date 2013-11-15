require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Building Model" do
  it 'can construct a new instance' do
    @building = Building.new
    refute_nil @building
  end
end
