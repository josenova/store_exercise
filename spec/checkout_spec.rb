require 'spec_helper'

describe Checkout do

  before :each do
    @checkout = Checkout.new []
    @voucher = Item.new('VOUCHER', 'Cabify Voucher', '5.00')
  end

  describe "#new" do
      it "takes one parameter and returns a Checkout object" do
          expect(@checkout).to be_an_instance_of Checkout
      end
  end

  describe "#items" do
      it "returns an array" do
          expect(@checkout.items).to be_an Array
      end
  end

  describe "#promotions" do
      it "returns an array" do
          expect(@checkout.promotions).to be_an Array
      end
  end

  describe "#scan" do
      it "should add an existing item" do
          expect(@checkout.scan("VOUCHER")).to be_an_instance_of LineItem
          expect(@checkout.items.find { |li| li.item.code == "VOUCHER" }).to be_truthy
      end

      it "should fail when scanning a nonexistent item" do
          expect(@checkout.scan("CAR")).to be_falsey
      end

      it "should add item quantity plus one" do
        #
      end
  end

  describe "#descan" do
    it "should return nil if item is not in cart" do
        expect(@checkout.descan("VOUCHER")).to be_falsey
    end

      it "should return nil if item is removed from cart" do
          @checkout.scan("VOUCHER")
          expect(@checkout.descan("VOUCHER")).to be_falsey
      end

      it "should return Line Item object if there is more than one of said item in cart" do
          @checkout.scan("VOUCHER")
          @checkout.scan("VOUCHER")
          expect(@checkout.descan("VOUCHER")).to be_an_instance_of LineItem
      end

      it "should fail when scanning a nonexistent item" do
          expect(@checkout.descan("CAR")).to be_falsey
      end
  end

  describe "#total" do
    it "should return a string" do
        expect(@checkout.total).to be_a String
    end

    it "should sum subtotals" do
        @checkout.scan("VOUCHER")
        @checkout.scan("VOUCHER")
        expect(@checkout.total).to eq("€10.00")
    end
  end



end
