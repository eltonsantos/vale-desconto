class FakeStoreService
  include HTTParty
  base_uri 'https://fakestoreapi.com'

  def self.fetch_products
    response = get('/products?limit=5')
    products = response.parsed_response.map do |product_data|
      Product.new(
        image: product_data['image'],
        title: product_data['title'],
        description: product_data['description'],
        price: product_data['price']
      )
    end
  end
end