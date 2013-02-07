require 'spec_helper'

describe "MultiSite" do

  it "should be true if the number of users shown in the site scope is the same doing a where query" do
      site_1 = FactoryGirl.create(:site)
      site_2 = FactoryGirl.create(:site)
      site_3 = FactoryGirl.create(:site)

      20.times { FactoryGirl.create(:user, :site => site_1) }
      10.times { FactoryGirl.create(:user, :site => site_2) }

    MultiSite.current_site = site_1
    User.on_site.count.should == User.where(:site_id => site_1.id).count

    MultiSite.current_site = site_2
    User.on_site.count.should == User.where(:site_id => site_2.id).count

    MultiSite.current_site = site_3
    User.on_site.count.should == 0
  end

  it "should return true if users is scoped by site" do
    answer = User.is_scoped_by_site?
    answer.should == true
    
    answer = Site.is_scoped_by_site?
    answer.should == false
  end

end
