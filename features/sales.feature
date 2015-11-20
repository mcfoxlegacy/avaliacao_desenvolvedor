# language: pt
Funcionalidade: Registrar Vendas
  Essa tela é responsável por exibir todas as vendas registradas pelo cliente
  As vendas somente podem ser registradas a partir de arquivos de extensão .txt e 
que possuam as seguintes colunas separadas por um caracter de TAB:

    Comprador    descrição    Preço Unitário    Quantidade    Endereço    Fornecedor

  Qualquer outro tipo de arquivo que não seja .txt deve ser ignorado e uma mensagem de
erro deve ser exibida para o usuário
  Todas as vendas registradas devem ser exibidas em uma tabela
  O cliente poderá apagar um registro
  
  @trucateDB
  Cenário: A página inicial deve ser a de registro de telas e não deve ser exibida nenhuma venda registrada
    Dado que estou na tela inicial
    Então não vejo nenhuma venda registrada

  Esquema do Cenário: Não posso realizar o upload de arquivos que não sejam txt
    Dado que estou na tela inicial
    Quando realizar o upload de um arquivo "<TIPO>"
    Então devo ver uma mensagem de erro de "formato inválido"

    Exemplos:
    | TIPO |
    | PDF  |
    | JPG  |
    | PNG  |

  Cenário: Se enviar um arquivo TXT inválido, devo ver uma mensagem de erro e nenhum registro deve ser importado
    Dado que estou na tela inicial
    Quando enviar um arquivo TXT inválido
    Então não vejo nenhuma venda registrada
    E devo ver uma mensagem de erro de "arquivo inválido"

  Cenário: Se enviar um arquivo TXT válido, devo ver uma mensagem de sucesso e os registro importados
    Dado que estou na tela inicial
    Quando enviar um arquivo TXT válido
    Então devo ver uma mensagem de "sucesso ao enviar o arquivo"
    E devo ver os seguintes valores cadastrados:
    | Joao Silva     | R$10 off R$20 of food    | 10.0 | 2 | 987 Fake St   | Bob's Pizza            |
    | Amy Pond       | R$30 of awesome for R$10 | 10.0 | 5 | 456 Unreal Rd | Tom's Awesome Shop     |
    | Marty McFly    | R$20 Sneakers for R$5    |  5.0 | 1 | 123 Fake St   | Sneaker Store Emporium |
    | Snake Plissken | R$20 Sneakers for R$5    |  5.0 | 4 | 123 Fake St   | Sneaker Store Emporium |
