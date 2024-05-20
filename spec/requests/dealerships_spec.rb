require 'rails_helper'

RSpec.describe "Dealerships", type: :request do
it 'GET /index returns success' do
    Dealership.create!(name: 'TT Motors')
    Dealership.create!(name: 'Drive and car')

    get dealerships_url
    assert_response :success
    assert_match 'TT Motors', response.body
    assert_match 'Drive and car', response.body
  end

  it 'GET /show returns success' do
    dealership = Dealership.create!(name: 'TT Motors')

    get dealership_url(dealership.id)
    assert_response :success
    assert_match 'TT Motors', response.body
  end

  describe 'POST /create' do
    context 'when dealership valid' do
      it 'redirects to show new dealership' do
        post dealerships_url, params: { dealership: { name: 'Ferrari' } }

        expect(response).to redirect_to(dealership_path(Dealership.last))
      end
    end

    context 'when dealership invalid' do
      it 'renders the errors' do
        post dealerships_url, params: { dealership: { name: nil } }

        assert_match 'be blank', response.body
      end
    end
  end

  it 'GET /edit returns success' do
    dealership = Dealership.create!(name: 'TT Motors')

    get dealerships_path(dealership.id)
    assert_response :success
    assert_match 'TT Motors', response.body
  end

  describe 'PATCH /update' do
    context 'when dealership valid' do
      it 'returns success' do
        dealership = Dealership.create!(name: 'TT Motors')

        patch dealership_url(dealership.id), params: { dealership: { name: 'Updated' } }

        expect(response).to redirect_to(dealership_path(Dealership.last))
      end
    end

    context 'when dealership invalid' do
      it 'renders the errors' do
        dealership = Dealership.create!(name: 'TT Motors')

        patch dealership_url(dealership.id), params: { dealership: { name: nil } }

        assert_match 'be blank', response.body
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to root path' do
      dealership = Dealership.create!(name: 'TT Motors')

      delete dealership_url(dealership.id)

      expect(response).to redirect_to(root_path)
    end
  end
end
