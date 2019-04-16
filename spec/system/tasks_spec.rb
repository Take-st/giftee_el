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

  describe '上から作成日時の新しい順版に並び替えのテスト' do
    before do
      @task = FactoryBot.create(:task, name: '一番下にくるタスク')
      @task2 = FactoryBot.create(:task, name: '真ん中にくるタスク')
      @task3 = FactoryBot.create(:task, name: '一番上にくるタスク')
    end
    context '一覧ページを見たとき' do
      before do
        visit tasks_path
      end
      it '上から作成日時の新しい順番にならんでいる' do
        within '.tasks' do
          task_names = all('.task-title').map(&:text)
          expect(task_names).to eq %w(一番上にくるタスク 真ん中にくるタスク 一番下にくるタスク)
        end
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