# frozen_string_literal: true

require 'rails_helper'

describe Admin::AdminController do
  let!(:site) { create(:site) }
  let!(:another_site) { create(:site, url: 'another_site') }

  before(:each) { MultiSite::Supra.default_site = site }

  it 'is aware of a current site selection' do
    get :show
    expect(JSON.parse(response.body)).to eq(site.as_json)
  end

  it 'switches managed site' do
    put :switch_site, params: { site_id: another_site.id }
    get :show
    expect(JSON.parse(response.body)).to eq(another_site.as_json)
  end
end
