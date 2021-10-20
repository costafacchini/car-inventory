require 'rails_helper'

RSpec.describe Dealership, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#cars' do
    it { is_expected.to have_many(:cars).dependent(:restrict_with_error) }
  end
end
