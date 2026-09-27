require "test_helper"

# == Schema Information
#
# Table name: document_chunks
#
#  id          :bigint           not null, primary key
#  content     :text
#  embedding   :vector(768)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  document_id :bigint           not null
#
# Indexes
#
#  index_document_chunks_on_document_id  (document_id)
#
# Foreign Keys
#
#  fk_rails_...  (document_id => documents.id)
#
class DocumentChunkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
