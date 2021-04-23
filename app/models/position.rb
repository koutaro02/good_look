class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '監督、職長'},
    { id: 3, name: '副職長'},
    { id: 4, name: '作業員'},
  ]

  include ActiveHash::Associations
  has_many :users
end
