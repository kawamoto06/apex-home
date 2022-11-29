class Rank < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ルーキー' },
    { id: 3, name: 'ブロンズ' },
    { id: 4, name: 'シルバー' },
    { id: 5, name: 'ゴールド' },
    { id: 6, name: 'プラチナ' },
    { id: 7, name: 'ダイヤ' },
    { id: 8, name: 'マスター' },
    { id: 9, name: 'プレデター' }
  ]

  include ActiveHash::Associations
  has_many :users
end