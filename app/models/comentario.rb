class Comentario
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :post, inverse_of: :comentarios

  validates_presence_of :nome_usuario, :texto
  field :nome_usuario, type: String
  field :texto, type: String
  field :post_id, type: Integer
end
