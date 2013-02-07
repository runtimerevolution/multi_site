require 'spec_helper'

describe UsersController do

  context "change of site scope" do

    before(:each) do
      @site_1 = FactoryGirl.create(:site)
      @site_2 = FactoryGirl.create(:site)
      10.times do
        FactoryGirl.create(:user, :site => @site_1)
        FactoryGirl.create(:user, :site => @site_2)
      end
    end

    it "should be true if current scope shows site_1" do
      get :index, :multi_site => @site_1.url
      MultiSite.current_site.should == @site_1

      get :index, :multi_site => @site_2.url
      MultiSite.current_site.should == @site_2
    end

  end
end