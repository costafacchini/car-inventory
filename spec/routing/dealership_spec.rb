require 'rails_helper'

RSpec.describe Dealership, type: :routing do
  describe 'dealerships routing' do
    it 'routes to index (root)' do
      assert_generates '/dealerships', { controller: 'dealerships', action: 'index' }
    end

    it 'routes to show' do
      assert_generates '/dealerships/1', { controller: 'dealerships', action: 'show', id: '1' }
    end

    it 'routes to new' do
      assert_generates '/dealerships/new', { controller: 'dealerships', action: 'new' }
    end

    it 'routes to create' do
      assert_generates '/dealerships', { controller: 'dealerships', action: 'create' }
    end

    it 'routes to edit' do
      assert_generates '/dealerships/1/edit', { controller: 'dealerships', action: 'edit', id: '1' }
    end

    it 'routes to update' do
      assert_generates '/dealerships/1', { controller: 'dealerships', action: 'update', id: '1' }
    end

    it 'routes to destroy' do
      assert_generates '/dealerships/1', { controller: 'dealerships', action: 'destroy', id: '1' }
    end
  end
end