documents = [
  {
    filename: "ruby.txt",
    chunks: [
      "Ruby is a dynamic programming language focused on simplicity and developer productivity.",
      "Ruby uses objects for values such as numbers, strings, arrays, and classes.",
      "Ruby supports blocks, iterators, modules, and metaprogramming."
    ]
  },
  {
    filename: "coffee.txt",
    chunks: [
      "Coffee beans are the seeds found inside the fruit of coffee plants.",
      "Roasting changes the color, aroma, acidity, and flavor of coffee beans.",
      "Espresso is prepared by forcing hot water through finely ground coffee."
    ]
  },
  {
    filename: "berlin.txt",
    chunks: [
      "Berlin is the capital and largest city of Germany.",
      "The Berlin Wall divided East and West Berlin during the Cold War.",
      "Berlin has an extensive public transportation network including trains, trams, and buses."
    ]
  },
  {
    filename: "guitar.txt",
    chunks: [
      "A guitar is a stringed musical instrument commonly made with six strings.",
      "Electric guitars use pickups to convert string vibrations into electrical signals.",
      "Guitar players can create chords by pressing multiple strings against the fretboard."
    ]
  },
  {
    filename: "space.txt",
    chunks: [
      "The Moon is Earth's natural satellite and completes an orbit around Earth.",
      "Mars is a rocky planet with a thin atmosphere primarily composed of carbon dioxide.",
      "Jupiter is the largest planet in the Solar System and has a large number of moons."
    ]
  },
  {
    filename: "cooking.txt",
    chunks: [
      "Boiling food involves cooking it in water at approximately one hundred degrees Celsius.",
      "Salt can enhance the perceived flavor of many dishes.",
      "Baking uses controlled heat to transform mixtures such as dough and batter."
    ]
  },
  {
    filename: "postgresql.txt",
    chunks: [
      "PostgreSQL is an open-source relational database management system.",
      "PostgreSQL supports transactions, foreign keys, indexes, and complex queries.",
      "Extensions allow PostgreSQL to provide functionality beyond its core features."
    ]
  },
  {
    filename: "mountains.txt",
    chunks: [
      "Mountains are elevated portions of the Earth's crust with steep slopes.",
      "The Himalayas contain Mount Everest, the highest mountain above sea level.",
      "Mountain ecosystems can change significantly with increasing altitude."
    ]
  },
  {
    filename: "football.txt",
    chunks: [
      "Football is a team sport played between two teams attempting to score goals.",
      "A standard football match consists of two halves of forty-five minutes.",
      "Players can pass, dribble, and shoot the ball while following the rules of the game."
    ]
  },
  {
    filename: "internet.txt",
    chunks: [
      "The Internet is a global network connecting computers and other devices.",
      "HTTP is a protocol commonly used for communication between web browsers and servers.",
      "DNS translates human-readable domain names into IP addresses."
    ]
  }
]

documents.each do |data|
  document = Document.create!(
    filename: data[:filename],
    content: data[:chunks].join("\n\n")
  )

  data[:chunks].each do |content|
    puts "Embedding #{data[:filename]}: #{content[0..50]}..."

    embedding = EmbeddingService.call(content)

    document.document_chunks.create!(
      content: content,
      embedding: embedding
    )
  end
end# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
