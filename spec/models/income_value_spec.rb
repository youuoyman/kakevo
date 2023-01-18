require 'rails_helper'

RSpec.describe IncomeValue, type: :model do
  before do
    @income_value = FactoryBot.build(:income_value)
  end
  describe '収入科目データ新規登録' do
    context '収入科目データ新規登録できるとき' do
      it 'income_idが空ではないとき' do
        expect(@income_value).to be_valid
      end
    end
    context '収入科目データ新規登録できないとき' do
      it 'income_idが空だと登録できない' do
        @income_value.income_id = nil
        @income_value.valid?
        expect(@income_value.errors.full_messages).to include "Income can't be blank"
      end
    end
  end
end
