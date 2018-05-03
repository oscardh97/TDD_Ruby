#Librerías necesarias para TDD
require "minitest/autorun"
require "minitest/spec"

$:.unshift File.expand_path(File.dirname(__FILE__) + "/..")

#Archivo de la clase a testar
require "lib/client"

#Inicio del test case
describe Client do
	subject {Client.new "Lucas"}

	#Test case para verificar que el objeto a testar sea una instancia de Client
	it "must be an instance of Client" do
		subject.must_be_instance_of Client
	end

	#Test case para verificar que tiene el atributo nombre
	it "must have a name" do
		subject.must_respond_to "name"
	end

	#Test case para verificar que siempre la instancia sea inicializada con un nombre
	it "must initialize with a name" do
		client = Client.new "Juan"
		client.name.must_equal "Juan"
	end

	#Test case para verificar que tiene el atributo de productos
	it "should have products" do
		subject.must_respond_to "products"
	end

	#Test case para verificar que siempre la instancia cree un arreglo de productos vacíos
	it "Must have an empty array of products" do
		subject.products.must_be_instance_of Array
		subject.products.must_be_empty
	end

	#Test case para el método Adicionar Producto
	describe "#add_product" do
		before do
			@client = Client.new "Pancho"
		end

		#Test case para verificar que existe dicho método
		it "responds to the add_product method" do
			@client.must_respond_to "add_product"
		end

		#Test case para verificar que al añadir un producto retorne dicho producto
		it "returns the products" do
			@client.add_product("Cellphone").must_equal "Cellphone"
		end
		
		#Test case para verificar que el producto fue añadido
		it "adds the value to the products" do
			@client.add_product "Cellphone"
			@client.products.must_include "Cellphone"
		end
	end

	#Test case para el método Obtener Producto Favorito
	describe "#get_favorite_product" do
		before do
			@products = ["Cellphone", "TV", "Cellphone", "Earphones"]
			@client = Client.new "John"
		end

		#Test case para verificar que existe dicho método
		it "responds to the get_favorite_product method" do
			@client.must_respond_to "get_favorite_product"
		end

		#Test case para verificar que el producto favorito coincide de acuerdo a los productos añadidos
		it "returns the favorite product" do
			@products.each do |product|
				@client.add_product product
			end

			@favorite = @products.max_by{|x| @products.count(x) }
			
			@client.get_favorite_product.must_equal @favorite
		end
	end
end