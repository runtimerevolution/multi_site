require 'rails_helper'

describe 'MultiSite' do
  it 'should be true if the number of users shown in the site scope is the same doing a where query' do
    site1 = create(:site)
    site2 = create(:site)
    site3 = create(:site)

    20.times { create(:user, site: site1) }
    10.times { create(:user, site: site2) }

    MultiSite.current_site = site1
    expect(User.on_site.count).to eq(User.where(site_id: site1.id).count)

    MultiSite.current_site = site2
    expect(User.on_site.count).to eq(User.where(site_id: site2.id).count)

    MultiSite.current_site = site3
    expect(User.on_site.count).to eq(0)
  end

  it 'should return true if users is scoped by site' do
    answer = User.is_scoped_by_site?
    expect(answer).to eq(true)

    answer = Site.is_scoped_by_site?
    expect(answer).to eq(false)
  end
end
