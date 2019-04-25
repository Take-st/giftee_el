# spec/models

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "検索機能のクラスメソッドのテスト" do
    before do
      @task1 = FactoryBot.create(:task, name: '４月１０日', deadline_at: '2019-04-10', status: 'New')
      @task2 = FactoryBot.create(:task, name: '４月１１日', deadline_at: '2019-04-11', status: 'WIP')
      @task3 = FactoryBot.create(:task, name: '４月１２日', deadline_at: '2019-04-12', status: 'Done')
      @task4 = FactoryBot.create(:task, name: 'New Super Mario', deadline_at: '2019-04-13', status: 'Done')
    end
    it "絞りこめているか" do
      tasks = Task.search('New')
      expect(tasks.first.name).to eq @task1.name
      expect(tasks.second.name).to eq @task4.name
    end
  end
end