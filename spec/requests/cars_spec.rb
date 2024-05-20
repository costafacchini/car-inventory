require 'rails_helper'

RSpec.describe "Cars", type: :request do
  it 'GET /index returns success' do
    dealership = Dealership.create!(name: 'TT Motors')
    Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: dealership)
    Car.create!(name: 'Mustang', manufactured_at: Time.now, dealership: dealership)

    get cars_url
    assert_response :success
    assert_match 'Ferrari', response.body
    assert_match 'Mustang', response.body
  end

  it 'GET /show returns success' do
    car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

    get car_url(car.id)
    assert_response :success
    assert_match 'Ferrari', response.body
  end

  describe 'POST /create' do
    context 'when user logged in' do
      context 'when car valid' do
        it 'redirects to show new car' do
          dealership = Dealership.create!(name: 'TT Motors')

          post cars_url, params: { car: { name: 'Ferrari', manufactured_at: Time.now, dealership_id: dealership.id } },
            headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials("admin", "secret") }

          expect(response).to redirect_to(car_path(Car.last))
        end
      end

      context 'when car invalid' do
        it 'renders the errors' do
          post cars_url, params: { car: { name: nil } },
            headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials("admin", "secret") }

          assert_match 'be blank', response.body
        end
      end
    end

    context 'when user not logged' do
      it 'returns unauthorized' do
        dealership = Dealership.create!(name: 'TT Motors')

        post cars_url, params: { car: { name: 'Ferrari', manufactured_at: Time.now, dealership_id: dealership.id } }

        assert_response :unauthorized
      end
    end
  end

  it 'GET /edit returns success' do
    car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

    get cars_path(car.id)
    assert_response :success
    assert_match 'Ferrari', response.body
  end

  describe 'PATCH /update' do
    context 'when car valid' do
      it 'returns success' do
        car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

        patch car_url(car.id), params: { car: { name: 'Updated' } }

        expect(response).to redirect_to(car_path(Car.last))
      end
    end

    context 'when car invalid' do
      it 'renders the errors' do
        car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

        patch car_url(car.id), params: { car: { name: nil } }

        assert_match 'be blank', response.body
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when user logged in' do
      it 'redirects to root path' do
        car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

        delete car_url(car.id), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials("admin", "secret") }

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user not logged' do
      it 'returns unauthorized' do
        car = Car.create!(name: 'Ferrari', manufactured_at: Time.now, dealership: Dealership.create!(name: 'TT Motors'))

        delete car_url(car.id)

        assert_response :unauthorized
      end
    end
  end
end
