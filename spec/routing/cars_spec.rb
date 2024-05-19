require 'rails_helper'

RSpec.describe Car, type: :routing do
  describe 'cars routing' do
    it 'routes to index (root)' do
      assert_generates '/', { controller: 'cars', action: 'index' }
    end

    it 'routes to show' do
      assert_generates '/cars/1', { controller: 'cars', action: 'show', id: '1' }
    end

    it 'routes to new' do
      assert_generates '/cars/new', { controller: 'cars', action: 'new' }
    end

    it 'routes to create' do
      assert_generates '/cars', { controller: 'cars', action: 'create' }
    end

    it 'routes to edit' do
      assert_generates '/cars/1/edit', { controller: 'cars', action: 'edit', id: '1' }
    end

    it 'routes to update' do
      assert_generates '/cars/1', { controller: 'cars', action: 'update', id: '1' }
    end

    it 'routes to destroy' do
      assert_generates '/cars/1', { controller: 'cars', action: 'destroy', id: '1' }
    end
  end
end