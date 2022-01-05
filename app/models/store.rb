class Store < ActiveRecord::Base
    has_many :stocks
    has_many :items, through: :stocks
end