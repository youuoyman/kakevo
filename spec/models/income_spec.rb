require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = FactoryBot.build(:income)
  end
  describe '収入科目新規登録' do
    context '収入科目新規登録できるとき' do
      it 'nameが空ではないとき' do
        expect(@income).to be_valid
      end
    end
    context '収入科目新規登録できないとき' do
      it 'nameが空だと登録できない' do
        @income.name = ""
        @income.valid?
        expect(@income.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end

