require 'spec_helper'
describe 'pkgbuilder' do

  context 'with defaults for all parameters' do
    it { should contain_class('pkgbuilder') }
  end
end
