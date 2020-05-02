#Jessica Diniz - 01/05/2020
#Desafio Zup - Automação Web

#Acesso a aplicação e-comerce TodaFrida
Dado("que acessei o portal") do
  visit 'https://www.todafrida.com.br/novidades'

sleep 5

end

#Informo Produto para busca de acordo com BDD
Quando('realizar a busca por {string}') do |produto|
  find('#search').set produto
  find(:xpath, "/html/body/div[1]/div/div[2]/div[1]/div[1]/form/div/button").click

sleep 5

end

#Visualizo detalhes do produto
Então("devo ser direcionado detalhes do produto") do
  find(:xpath, "/html/body/div[1]/div/div[4]/div/div/div[1]/div[4]/ul[1]/li[1]/div/div[2]/h2/a").click
#Validação que produto está disponivel para compra
  expect(find('#compra')).to have_content 'COMPRAR'

end

#Seleciono Tamanho de Produto
E("seleciono tamanho e clico em comprar") do
  find(:xpath, "/html/body/div[1]/div/div[2]/div/div/div[4]/div[1]/form/div[2]/div[3]/div[4]/dl/dd/div/ul/li[3]/a/span[1]").click
#Clico em Comprar
  find('#compra').click
#Validação que Produto foi adicionado ao carrinho
find(:xpath, "/html/body/div[1]/div/div[2]/div/div/div[3]/div[2]/div[2]/div/div[4]/div/ul/li/button").click

sleep 5

end