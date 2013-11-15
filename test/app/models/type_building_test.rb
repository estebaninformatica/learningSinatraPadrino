require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "TypeBuilding Model" do
  it 'can construct a new instance' do
    @type_building = TypeBuilding.new
    refute_nil @type_building
  end
end
