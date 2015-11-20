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
