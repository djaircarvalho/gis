class Logradouro < ApplicationRecord
	belongs_to :quadra_direita, class_name: :Quadra
	belongs_to :quadra_esquerda, class_name: :Quadra
	validates :quadra_direita, presence: true
	validates :quadra_esquerda, presence: true
end
