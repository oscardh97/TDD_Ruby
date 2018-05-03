class Client
	attr_reader :name
	attr_reader :products
	def initialize name
		@name = name
		@products = []
	end

	#Agrega un producto y lo retorna
	def add_product product
		@products.push product
		product
	end

	#Retorna el producto más repetido
	def get_favorite_product
		return @products.max_by{|x| @products.count(x) }
	end
end