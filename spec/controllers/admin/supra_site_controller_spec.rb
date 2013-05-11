require 'spec_helper'

describe Admin::AdminController do
  let!(:site) { FactoryGirl.create(:site) }
  let!(:another_site) { FactoryGirl.create(:site, url: 'another_site') }

  before(:each) { MultiSite::Supra.default_site = site }

  it "is aware of a current site selection" do
    get :show
    assigns(:admin_site).should eq(site)
  end

  it "switches managed site" do
    put :switch_site, site_id: another_site.id
    get :show
    assigns(:admin_site).should eq(another_site)
  end
end