require 'rails_helper'

RSpec.describe FixedValue, type: :model do
  before do
    @fixed_value = FactoryBot.build(:fixed_value)
  end
  describe '固定費科目データ新規登録' do
    context '固定費科目データ新規登録できるとき' do
      it 'fixed_idが空ではないとき' do
        expect(@fixed_value).to be_valid
      end
    end
    context '固定費科目データ新規登録できないとき' do
      it 'fixed_idが空だと登録できない' do
        @fixed_value.fixed_id = nil
        @fixed_value.valid?
        expect(@fixed_value.errors.full_messages).to include "Fixed can't be blank"
      end
    end
  end
end
