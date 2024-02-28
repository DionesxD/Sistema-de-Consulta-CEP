# Sistema de Consulta de Endereço por CEP

Este é um projeto que permite aos usuários do sistema acessar informações de endereço com base em um CEP fornecido. Para isso, o sistema utiliza duas APIs: ViaCEP e AwesomeAPI. A primeira é a principal fonte de consulta, mas caso esteja indisponível, a segunda é usada como backup.

## Funcionalidades

- Consulta de endereço por CEP
- Utiliza ViaCEP como fonte principal de informações
- Faz fallback para a AwesomeAPI em caso de falha do ViaCEP
- Exibe informações detalhadas do endereço, incluindo logradouro, bairro, cidade, estado, etc.

## Como usar

1. Clone o repositório para sua máquina local:
 ```
git clone https://github.com/DionesxD/Sistema-de-Consulta-CEP.git
 ```
2. Abra o projeto em seu ambiente de desenvolvimento Delphi.

3. Compile e execute o projeto.
   
   ![image](https://github.com/DionesxD/Sistema-de-Consulta-CEP/assets/110851857/ffd8d44b-3782-43c8-a362-e2db4c28e545)


5. Na interface do usuário, digite o CEP desejado no campo de entrada e clique em "Consultar" ou pressione Enter.
   
   ![image](https://github.com/DionesxD/Sistema-de-Consulta-CEP/assets/110851857/f6ec3f1e-3bab-412c-a051-98f0a32bf2bd)


7. Aguarde a resposta da API, que será exibida na interface do usuário.
   
   ![image](https://github.com/DionesxD/Sistema-de-Consulta-CEP/assets/110851857/bc269bd0-0980-4163-bfe7-0bb842ef6927)


## Dependências

Este projeto depende das seguintes bibliotecas/frameworks:

- FireMonkey (FMX)
- REST.Client (parte do RAD Studio/Delphi)
- FireDAC (parte do RAD Studio/Delphi)

## Configuração

Certifique-se de que sua conexão com a internet esteja ativa para permitir o acesso às APIs.

## Contribuindo

Contribuições são bem-vindas! Se você encontrar um bug ou tiver alguma ideia para melhorar o sistema, fique à vontade para abrir uma issue ou enviar um pull request.

## Agradecimentos

- ViaCEP e AwesomeAPI por fornecerem os serviços de consulta de endereço por CEP.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
