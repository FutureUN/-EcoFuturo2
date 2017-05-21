class AddEcoUserIdToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :ecoUser, foreign_key: true
  end
end
