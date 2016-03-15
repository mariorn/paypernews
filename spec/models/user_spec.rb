require 'rails_helper'

RSpec.describe Hotel, type: :model do
  context 'two hotels with the same name' do
    before (:each) do
      @hotel1 = Hotel.create({ name: 'test-hotel', 
                               address: 'Calle de Claudio Coello, 139, 28006 Madrid, Madrid, España',
                               latlong: 'POINT(40.4355254 -3.6855281000000056)',
                               price: 10,
                               website: 'http://www.website.com/' })

      @hotel2 = Hotel.create({ name: 'test-hotel', 
                               address: 'Calle de Claudio Coello, 139, 28006 Madrid, Madrid, España',
                               latlong: 'POINT(40.4355254 -3.6855281000000056)',
                               price: 10,
                               website: 'http://www.website.com/' })
    end

    it 'it should save just one of the hotels' do
      hotels = Hotel.all
      expect(hotels.length).to be(1)
    end
  end

  context 'two hotels with different name' do
    before (:each) do
      @hotel1 = Hotel.create({ name: 'test-hotel', 
                               address: 'Calle de Claudio Coello, 139, 28006 Madrid, Madrid, España',
                               latlong: 'POINT(40.4355254 -3.6855281000000056)',
                               price: 10,
                               website: 'http://www.website.com/' })

      @hotel2 = Hotel.create({ name: 'test-hotel2', 
                               address: 'Calle de Claudio Coello, 139, 28006 Madrid, Madrid, España',
                               latlong: 'POINT(40.4355254 -3.6855281000000056)',
                               price: 10,
                               website: 'http://www.website.com/' })
    end

    it 'it should save just one of the hotels' do
      hotels = Hotel.all
      expect(hotels.length).to be(2)
    end
  end
end