class EmbeddingService
  URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent"

  def self.call(text)
    response = Faraday.post(URL) do |req|
      req.params["key"] = ENV.fetch("GEMINI_API_KEY")
      req.headers["Content-Type"] = "application/json"

      req.body = {
        model: "models/gemini-embedding-001",
        content: {
          parts: [
            { text: text }
          ]
        },
        output_dimensionality: 768
      }.to_json
    end

    puts response.body

    raise "Gemini API error: #{response.status}" unless response.success?

    JSON.parse(response.body).fetch("embedding").fetch("values")
  end
end