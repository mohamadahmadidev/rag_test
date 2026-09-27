class ChangeEmbeddingDimension < ActiveRecord::Migration[8.1]
  def change
    change_column :document_chunks, :embedding, :vector, limit: 768
  end
end
