Given(/^Im logged in my admin page on nobalk$/) do
  visit'https://bigboss-dmop.c9users.io/login'
  @user = User.create!(
    :name => "danilo",
    :email =>"danilo@danilo.com",
    :password => "danilo",
    :activated => true
  )
  @empresa = @user.empresas.build({"nome_fantasia"=>"Test", "email"=>"test@test.com", "cnpj"=>"1234", "razao_soc"=>"1234"})
  @empresa.save
  @user.active_empresa = @empresa.id
  @user.save
  
  fill_in 'username', :with => 'danilo@danilo.com'  

  fill_in 'password', :with => 'danilo'  

  click_button("Entrar")
  assert_current_path('/admin')
end

Then(/^I should see the map$/) do
  assert_current_path('/admin')
  page.find(:id, 'map').nil?
end





