require 'rails_helper'

RSpec.describe Fixed, type: :model do
  before do
    @fixed = FactoryBot.build(:fixed)
  end
  describe '固定費科目新規登録' do
    context '固定費科目新規登録できるとき' do
      it 'nameが空ではないとき' do
        expect(@fixed).to be_valid
      end
    end
    context '固定費科目新規登録できないとき' do
      it 'nameが空だと登録できない' do
        @fixed.name = ""
        @fixed.valid?
        expect(@fixed.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end
