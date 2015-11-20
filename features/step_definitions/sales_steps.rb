# coding: utf-8

###### DADO ######

Dado(/^que estou na tela inicial$/) do
  visit '/'
  # Fazer alguma verificacao para garantir que estamos na pagina inicial
end

###### QUANDO ######

Quando(/^realizar o upload de um arquivo "(.*?)"$/) do |format|
  attach_file('sale_upload_file',
              File.absolute_path(FILES[format.downcase.to_sym]))
end

Quando(/^enviar um arquivo TXT (inválido|válido)$/) do |validity|
  attach_file('sale_upload_file',
              File.absolute_path(FILES[validity.to_sym]))
end

###### ENTAO ######

Então(/^não vejo nenhuma venda registrada$/) do
  result = page.all(:css, '#sales tbody')
  # There should be one tbody in the screen
  fail 'There are more than 1 tbody in the screen' if
    result.length > 1
  fail 'There are no tbody in the screen' if
    result.length == 0

  # There should be no content in the tbody
  puts result.first.text
  fail 'The tbody is not empty' unless
    result.first.text == ''
end

Então(/^devo ver uma mensagem de erro de "(.*?)"$/) do |message|
  page.has_content? MESSAGES[message.to_sym]
end
