require "test_helper"

# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  content    :text
#  filename   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
