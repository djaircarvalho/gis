class AddCodigoDeLogradouroToLogradouros < ActiveRecord::Migration[5.0]
  def change
    add_column :logradouros, :codigo_logradouro, :string
    add_column :logradouros, :numeracao_esquerda, :string
    add_column :logradouros, :numeracao_direita, :string
    add_column :logradouros, :largura_leito_carrocavel, :string
    add_column :logradouros, :servicos_existentes, :string
    add_column :logradouros, :infraestrutura_existente, :string
    add_column :logradouros, :existencia_de_pavimentacao, :string
    add_column :logradouros, :tipo_de_pavimentacao, :string
    add_column :logradouros, :existencia_de_guia_e_sarjeta, :string
    add_column :logradouros, :fluxo_estimado_de_veiculos, :string
    end
end
