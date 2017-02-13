require 'spec_helper'
describe 'comment_line', :type => :define do
  context 'compiles when invoked correctly' do
    let :title do
      "not used"
    end
    let :params do
      {
        :path  => "/foo/bar",
        :match => "baz"
      }
    end
    it { should compile }
  end

end
