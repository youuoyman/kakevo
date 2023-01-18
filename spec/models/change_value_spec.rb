require 'rails_helper'

RSpec.describe ChangeValue, type: :model do
  before do
    @change_value = FactoryBot.build(:change_value)
  end
  describe '変動費科目データ新規登録' do
    context '変動費科目データ新規登録できるとき' do
      it 'change_idが空ではないとき' do
        expect(@change_value).to be_valid
      end
    end
    context '変動費科目データ新規登録できないとき' do
      it 'change_idが空だと登録できない' do
        @change_value.change_id = nil
        @change_value.valid?
        expect(@change_value.errors.full_messages).to include "Change can't be blank"
      end
    end
  end
end


