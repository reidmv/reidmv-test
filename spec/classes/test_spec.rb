require 'spec_helper'

describe 'test' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      #it { is_expected.to compile }
      it { should compile.with_all_deps }
    end
  end
end
