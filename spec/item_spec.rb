require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
  describe 'items' do
    before :each do
        @item1 = Item.new({name: 'Peach Pie (slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (slice)', price: "$2.50"})
    end

    it 'it is an Item' do 
        expect(@item1).to be_an(Item)
        expect(@item2).to be_an(Item)
    end

    it 'has a name' do 
        expect(@item1.name).to eq('Peach Pie (slice)')
    end

    it 'has a price' do 
        expect(@item2.price).to eq("$2.50")
    end
  end
end
