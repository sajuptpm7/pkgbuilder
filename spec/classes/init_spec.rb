require 'spec_helper'
describe 'pkbuilder' do

  context 'with defaults for all parameters' do
    it { should contain_class('pkbuilder') }
  end
end
