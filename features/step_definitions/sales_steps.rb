# coding: utf-8

###### DADO ######

Dado(/^que estou na tela inicial$/) do
  visit '/'
  # Fazer alguma verificacao para garantir que estamos na pagina inicial
end

###### QUANDO ######

Quando(/^realizar o upload de um arquivo "(.*?)"$/) do |format|
  page.attach_file('sale_upload_file',
                   File.absolute_path(FILES[format.downcase.to_sym]))
  find(:css, '#button_file_upload').click
end

Quando(/^enviar um arquivo TXT (inválido|válido)$/) do |validity|
  page.attach_file('sale_upload_file',
                   File.absolute_path(FILES[validity.to_sym]))
  find(:css, '#button_file_upload').click
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

Então(/^devo ver uma mensagem(?: de erro|) de "(.*?)"$/) do |message|
  fail "Message not found on the page" unless
    page.has_content? MESSAGES[message.gsub(' ', '_').to_sym]
end

Então(/^devo ver os seguintes valores cadastrados:$/) do |table|
  table.raw.each do |row|
    row.each do |column|
      fail "'#{column}' not found on the page" unless
        page.has_content? column
    end
  end
end
