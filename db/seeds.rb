puts "Criando usuário padrão"
users = User.create!([{email: "admin@admin.com", password: 123456}])

puts "Criando produtos"
products = Product.create!([
  { title: "Produto 1", description: "Descrição do Produto 1", price: 10.0 }
])

puts "Criando descontos"
Discount.create([
  {
    name: "Biscoito integral cereale Cacau 150g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 0,
    activation_date: "2024-06-06 17:34:00",
    deactivation_date: "2024-06-11 17:34:00",
    status: 1,
    price_from: 5.6,
    price_to: 5.1,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito integral cereale Cacau 200g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 0,
    activation_date: "2024-06-01 17:34:00",
    deactivation_date: "2024-06-15 17:34:00",
    status: 0,
    price_from: 6.6,
    price_to: 6.1,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito cereale Cacau 250g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 1,
    activation_date: "2024-06-02 17:34:00",
    deactivation_date: "2024-06-10 17:34:00",
    status: 1,
    price: 5.85,
    quantity_leve: 3,
    quantity_pague: 2,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito cereale Cacau 150g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 1,
    activation_date: "2024-06-07 17:34:00",
    deactivation_date: "2024-06-12 17:34:00",
    status: 0,
    price: 6.7,
    quantity_leve: 5,
    quantity_pague: 4,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito cereale Cacau 90g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 2,
    activation_date: "2024-06-02 17:34:00",
    deactivation_date: "2024-06-08 17:34:00",
    status: 1,
    discount_percentage: 10,
    price_percentual: 2.55,
    price_final: 2.30,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito cereale Cacau 120g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 2,
    activation_date: "2024-06-01 17:34:00",
    deactivation_date: "2024-06-09 17:34:00",
    status: 0,
    discount_percentage: 10,
    price_percentual: 2.55,
    price_final: 2.30,
    product: products[0],
    user: users[0]
  },
  {
    name: "Biscoito cereale Cacau 170g",
    description: "O Biscoito Bauducco Cereale Cacau, Aveia e Mel Integrais é uma Fonte de fibras e com cereais integrais.",
    discount_type: 2,
    activation_date: "2024-06-01 17:34:00",
    deactivation_date: "2024-06-12 17:34:00",
    status: 1,
    discount_percentage: 10,
    price_percentual: 2.55,
    price_final: 2.30,
    product: products[0],
    user: users[0]
  }
])

puts "Salvando imagens"
Discount.all.each do |discount|
  image_path = Rails.root.join('app', 'assets', 'images', 'biscoito.png')
  discount.image.attach(io: File.open(image_path), filename: 'biscoito.png')
end 