# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  context 'change of site scope' do
    before(:each) do
      @site1 = create(:site)
      @site2 = create(:site)
      10.times do
        create(:user, site: @site1)
        create(:user, site: @site2)
      end
    end

    it 'should be true if current scope shows site_1' do
      get :index, params: { multi_site: @site1.url }
      expect(MultiSite.current_site).to eq(@site1)

      get :index, params: { multi_site: @site2.url }
      expect(MultiSite.current_site).to eq(@site2)
    end
  end
end
