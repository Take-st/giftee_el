# spec/system

require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能のテスト' do
    before do
      FactoryBot.create(:task, name: 'テスト用タスク', deadline_at: '2019-04-20')
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
      @task = FactoryBot.create(:task, name: '一番下にくるタスク', deadline_at: '2019-04-20')
      @task2 = FactoryBot.create(:task, name: '真ん中にくるタスク', deadline_at: '2019-04-20')
      @task3 = FactoryBot.create(:task, name: '一番上にくるタスク', deadline_at: '2019-04-20')
    end
    context '一覧ページを見たとき' do
      before do
        visit tasks_path
      end
      it '上から作成日時の新しい順番にならんでいる' do
        within '.tasks' do
          task_names = all('.task-name').map(&:text)
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
    context '一覧ページには飛ばないで検証' do
      it '名称が空だとNG' do
        expect(@task.valid?).to eq(false)
      end
      it '20文字以上だとNG' do
        expect(@task2.valid?).to eq(false)
      end
    end
  end

  # ここのテストは１つ目のテストと統合できそう
  describe '終了期限の設定のテスト' do
    before do
      @task = FactoryBot.create(:task, name: '終了期限は４月２０日', deadline_at: '2019-04-20')
    end
    context '一覧ページを見たとき' do
      before do
        visit tasks_path
      end
      it '終了期限付きのタスクが表示されている' do
        expect(page).to have_content '2019-04-20'
      end
    end
  end

  # ソートボタンをクリックして、並びが変わっていたらOK
  # それぞれのカラムには同じメソッドを使っているので一つを調べれば十分
  # 代表して、終了期限のソート機能を検証する。
  describe 'ソート機能のテスト' do
    before do
      @task = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10')
      @task = FactoryBot.create(:task, name: '５月２０日', deadline_at: '2019-05-20')
      @task = FactoryBot.create(:task, name: '６月３０日', deadline_at: '2019-06-30')
    end
    context '一度終了期限をクリックしたとき' do
      before do
        visit tasks_path
        click_link '終了期限'
      end
      it '上から終了期限の昇順に並んでいる' do
        within '.tasks' do
          task_names = all('.task-name').map(&:text)
          expect(task_names).to eq %w(４月１０日 ５月２０日 ６月３０日)
        end
      end
    end
    context '二度終了期限をクリックしたとき' do
      before do
        visit tasks_path
        click_link '終了期限'
        click_link '終了期限'
      end
      it '上から終了期限の降順に並んでいる' do
        within '.tasks' do
          task_names = all('.task-name').map(&:text)
          expect(task_names).to eq %w(６月３０日 ５月２０日 ４月１０日)
        end
      end
    end
  end

    describe '検索機能（絞り込み機能）のテスト' do
      before do 
        @task = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10', status: 'New')
        @task = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10', status: 'WIP')
        @task = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10', status: 'Done')
        @task = FactoryBot.create(:task, name: 'New Super Mario', deadline_at: '2019-04-10', status: 'Done')
      end
      context '一覧ページアクセス後、Newで検索をかけたとき' do
        before do
          visit tasks_path
          find("input[type='text']").set("New")
          click_on '検索する'
        end
        it 'New,newの文字をステータスか名称にもつタスクが２つだけ表示、それ以外は表示されない' do
          expect(page).to have_content('New', count: 2)
          expect(page).not_to have_content'WIP'
        end
      end
    end


    describe 'ソート機能のテスト' do
      before do
        @task = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10', priority: '高')
        @task = FactoryBot.create(:task, name: '５月２０日', deadline_at: '2019-05-20', priority: '中')
        @task = FactoryBot.create(:task, name: '６月３０日', deadline_at: '2019-06-30', priority: '低')
      end
      context '一度優先度をクリックしたとき' do
        before do
          visit tasks_path
          click_link '優先度'
        end
        it '上から優先度の昇順（中→低→高）に並んでいる' do
          within '.tasks' do
            task_names = all('.task-name').map(&:text)
            expect(task_names).to eq %w(５月２０日 ６月３０日 ４月１０日)
          end
        end
      end
      context '二度優先度をクリックしたとき' do
        before do
          visit tasks_path
          click_link '優先度'
          click_link '優先度'
        end
        it '上から優先度の降順（高→低→中）に並んでいる' do
          within '.tasks' do
            task_names = all('.task-name').map(&:text)
            expect(task_names).to eq %w(４月１０日 ６月３０日 ５月２０日)
          end
        end
      end
    end
    # 今の昇順・降順は要素の名前の順番になってしまっていて、中→低→高というふうに並んでいる。
    # 本当は高→中→低の順番にソートしたい。でも時間がないので時間があれば実装してみることにする。
end