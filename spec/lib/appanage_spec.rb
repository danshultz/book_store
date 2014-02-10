require 'spec_helper'
require 'appanage'

describe('appanage') do

  let(:roles) { [] }
  subject { Appanage.new(roles) }

  describe "access_admin privilege" do
    context "has admin roles" do
      let(:roles) { [double(:role, :name => 'admin')] }
      its(:can_access_admin) { should be_true }
    end

    its(:can_access_admin) { should be_false }
  end

end
