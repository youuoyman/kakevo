require 'rails_helper'

RSpec.describe Change, type: :model do
  before do
    @change = FactoryBot.build(:change)
  end
  describe '変動費科目新規登録' do
    context '変動費科目新規登録できるとき' do
      it 'nameが空ではないとき' do
        expect(@change).to be_valid
      end
    end
    context '変動費科目新規登録できないとき' do
      it 'nameが空だと登録できない' do
        @change.name = ""
        @change.valid?
        expect(@change.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end
