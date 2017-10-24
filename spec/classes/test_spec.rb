require 'spec_helper'

# describe 'test' do
#   on_supported_os(facterversion: '2.4').each do |os, os_facts|
#     context "on #{os}" do
#       let(:facts) { os_facts }
#
#       #it { is_expected.to compile }
#       it { should compile.with_all_deps }
#     end
#   end
# end

describe 'test' do

  on_supported_os(facterversion: '2.4').each do |os, os_facts|

    os_facts.merge!({ :external_repo_package => 'http://softwarelibrary.wellsfargo.com:12080/mrc-packages',
                      :external_repo_yum => 'http://softwarelibrary.wellsfargo.com:12080/yum' })

    context "on #{os}" do

      if os_facts[:operatingsystem] == 'windows'
        windows_facts = { :wf_domain => 'AD-ENT', :is_bunsen => true }
        let(:facts) { os_facts.merge(windows_facts) }
        # let :pre_condition do
        #   <<-EOF
        #   File {
        #     provider => 'posix',
        #   }
        #   EOF
        # end

        it { should compile }

      elsif os_facts[:operatingsystem] == 'RedHat'
        let(:facts) { os_facts }

      end

      # let(:facts) { os_facts }

      # it { should compile.with_all_deps }
      it { should contain_class('test') }

    end

  end

end
