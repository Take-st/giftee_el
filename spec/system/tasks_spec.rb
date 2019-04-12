require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能のテスト' do
    before do
      FactoryBot.create(:task, name: 'テスト用タスク')
    end
    context '一覧ページを見たとき' do
      before do
        visit tasks_path
      end
      it 'タスク一覧が表示される' do
        expect(page).to have_content 'テスト用タスク'
      end
    end
  end

  describe 'バリデーションのテスト' do
    before do
      @task = FactoryBot.build(:task, name: '')
      @task2 = FactoryBot.build(:task, name: 'このタスクは長さが２０文字いじょうあります。')
    end
    context '一覧ページを見たとき' do
      it '名称が空だとNG' do
        expect(@task.valid?).to eq(false)
      end
      it '20文字以上だとNG' do
        expect(@task2.valid?).to eq(false)
      end
    end
  end

end