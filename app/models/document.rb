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
class Document < ApplicationRecord
    has_many :document_chunks, dependent: :destroy

end
