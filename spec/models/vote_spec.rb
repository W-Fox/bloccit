require 'rails_helper'

describe Vote do
  describe "validations" do
    
    before do
      @invalid_vote = Vote.new(value: 2)
      @up_vote = Vote.new(value: 1)
      @down_vote = Vote.new(value: -1)
    end

    describe "up_vote#valid?" do
      it "only allows -1 or 1 as values" do
        expect( Vote.new(value: 1).valid?).to eq(true)
 #       expect(Vote.new(value: 1)).to be_valid
      end
    end

    describe "invalid_vote#valid?" do
      it "only allows 1 or -1 as a value" do
        expect( @invalid_vote.valid? ).to eq(false)
      end
    end

    describe "down_vote#valid?" do
      it "only allows 1 or -1 as a value" do
        expect( @down_vote.valid?).to eq(true)
      end
    end
  end
end