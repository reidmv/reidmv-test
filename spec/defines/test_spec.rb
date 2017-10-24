require 'spec_helper'

describe 'test::version' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:title) { 'test_title' }
      let(:facts) { os_facts }

      it { should compile }
    end
  end
end
