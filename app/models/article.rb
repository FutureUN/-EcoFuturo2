class Article < ApplicationRecord
	# La tabla => articles
	# Campos=> article.title() => 'el titulo del articulo'
	# Escribir metodos
	validates :title, presence: true
	#uniqueness: true (para que no se repita el valor del campo, por ejemplo el titulo)
	validates :body, presence: true, length: { minimum: 20}
	#validates :username, format: {with: /regex/ } para usuarios
end
