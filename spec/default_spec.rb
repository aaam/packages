require 'chefspec'

describe 'chef-packages::default' do
  let(:chef) do
    ChefSpec::ChefRunner.new
  end

  before(:each) do
    chef.node.set['packages'] = {
      'kernel'          => :upgrade,
      'kernel-firmware' => :upgrade,
      'pango'           => "purge", # Try different quoting methods
      'iotop'           => 'install'
    }
    chef.converge 'chef-packages::default'
  end

  it 'should perform the action for each package' do
    chef.should upgrade_package 'kernel'
    chef.should upgrade_package 'kernel-firmware'
    chef.should purge_package   'pango'
    chef.should install_package 'iotop'
  end
end
