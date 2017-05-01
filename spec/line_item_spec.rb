require 'spec_helper'

describe LineItem do

  before :each do
    item = Item.new('VOUCHER', 'Cabify Voucher', '5.00')
    promotion = Promotion.new('VOUCHER', 2, 1, 0.5)
    @line_item = LineItem.new(item, 1, promotion)
  end

  describe "#new" do
      it "takes three parameters and returns a Promotion object" do
          expect(@line_item).to be_an_instance_of LineItem
      end
  end

  describe "#item" do
      it "should return an Item object" do
          expect(@line_item.item).to be_an_instance_of Item
      end
  end

  describe "#add" do
      it "should increment quantity by 1" do
          expect(@line_item.quantity).to eq(1)
          @line_item.add
          expect(@line_item.quantity).to eq(2)
      end
  end

  describe "#substract" do
      it "should decrement quantity by 1" do
          @line_item.substract
          expect(@line_item.quantity).to eq(0)
      end
  end

  describe "#subtotal" do
      it "should return bigdecimal" do
          expect(@line_item.subtotal).to be_an(BigDecimal)
      end

      it "should return items price times quantity" do
          expect(@line_item.subtotal).to eq(0.5e1)
      end

      it "should discount promotion amount from subtotal" do
          @line_item.add
          expect(@line_item.quantity).to eq(2)
          expect(@line_item.subtotal).to eq(0.5e1)
      end


  end


end
