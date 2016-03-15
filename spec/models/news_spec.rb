require 'rails_helper'

RSpec.describe City, type: :model do
  context 'a city with all the parameters empty' do
    before (:each) do
      city = City.create({ name: '', latitude: '', longitude: '' })
    end

    it 'should not save the register' do
      cities = City.all
      expect(cities.length).to be(0)
    end
  end

  context 'a city with the latitude and longitude empty' do
    before (:each) do
      city = City.create({ name: 'Madrid', latitude: '', longitude: '' })
    end

    it 'should not save the register' do
      cities = City.all
      expect(cities.length).to be(0)
    end
  end

  context 'a city with the longitude empty' do
    before (:each) do
      city = City.create({ name: 'Madrid', latitude: '40.4167754', longitude: '' })
    end

    it 'should not save the register' do
      cities = City.all
      expect(cities.length).to be(0)
    end
  end

  context 'a city with the fields correctly filled' do
    before (:each) do
      city = City.create({ name: 'Madrid', latitude: '40.4167754', longitude: '-3.7037902' })
    end

    it 'should save the register' do
      cities = City.all
      expect(cities.length).to be(1)
    end
  end
end