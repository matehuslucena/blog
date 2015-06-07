class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
    embeds_many :comentarios



  validates_presence_of :titulo, :conteudo
  validates_length_of :conteudo, minimum: 15

  field :titulo, type: String
  field :conteudo, type: String
end
