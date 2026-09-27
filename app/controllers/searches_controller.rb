class SearchesController < ApplicationController
  def index
    @results = []
  end

  def create
    @question = params[:question]

    question_vector = EmbeddingService.call(@question)

    @results = DocumentChunk
      .nearest_neighbors(
        :embedding,
        question_vector,
        distance: "cosine"
      )
      .limit(3)
puts @results.map(&:content)
    render json: { results: @results.map(&:content) }
  end
end