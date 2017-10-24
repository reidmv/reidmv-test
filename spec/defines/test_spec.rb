require 'spec_helper'

describe 'test::version' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:title) { 'test_title' }
      let(:facts) { os_facts }
      let(:params) { { 'windows_path_symlink' => 'c:/Program Files/productdir' } }

      #it { is_expected.to compile }
      it { should compile.with_all_deps }
    end
  end
end
