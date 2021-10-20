require 'rails_helper'

RSpec.describe Car, type: :model do
  describe '#dealership' do
    it { is_expected.to belong_to(:dealership).required }
  end

  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#manufactured_at' do
    it { is_expected.to validate_presence_of :manufactured_at }
  end

  describe '#status' do
    it { is_expected.to validate_presence_of :status }

    it do
      is_expected.to define_enum_for(:status)
        .with_values(new: 0, used: 1)
        .backed_by_column_of_type(:integer)
        .with_prefix(true)
    end
  end

  describe '#sale_price' do
    it 'is equals to table_price if car is new' do
      subject = Car.new(status: :new, table_price: 1_000)

      expect(subject.sale_price).to eql 1_000
    end

    it 'is equals to (table_price - deprecation consider 2% every month) if car is used' do
      travel_to Time.utc(2021, 10, 16, 0, 0, 0) do
        car1 = Car.new(status: :used, table_price: 1_000, manufactured_at: Date.new(2021, 7, 1))
        car2 = Car.new(status: :used, table_price: 1_000, manufactured_at: Date.new(2021, 1, 1))
        car3 = Car.new(status: :used, table_price: 1_000, manufactured_at: Date.new(2020, 1, 1))

        expect(car1.sale_price).to eql 940
        expect(car2.sale_price).to eql 820
        expect(car3.sale_price).to eql 580
      end
    end
  end
end
