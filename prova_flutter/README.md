# Flutter Project Readme

Este é um projeto Flutter que demonstra o uso de algumas tecnologias e padrões comuns em aplicativos Flutter. O projeto utiliza MobX para gerenciamento de estado, SharedPreferences para persistência de dados locais, HTTP para fazer requisições a uma Mock API e Provider para injeção de dependência.

## Estrutura do Projeto

O projeto está organizado da seguinte maneira:

- `lib/`: Contém o código-fonte do aplicativo Flutter.
  - `src/`: Contém os arquivos fonte do projeto.
    - `shared/`: Contém componentes reutilizáveis.
     - `routes/`: Contém Classe para centralizar as rotas.
     - `validation/`: Contém mixin para validação de campos. 
    - `custom/`: Contém classe que centraliza a personalização do app.
    - `model/`: Contém as definições de modelos de dados.
    - `repository/`: Contém as classes responsáveis por interagir com APIs externas ou persistir dados localmente.
    - `erros/`: Contém classe para tratameto de erros.
    - `views/`: Contém as diferentes telas do aplicativo.
      - `login/`: Contém a estrutura do login.
         - `controller/`: Contém o controller de login.
         - `component/`: Contém componentes reutilizáveis de login.
         - `page/`: Contém page de login.
      - `home/`: Contém a estrutura do home.
         - `controller/`: Contém o controller de home.
         - `component/`: Contém componentes reutilizáveis de home.
         - `page/`: Contém page de home.
      - `shared/`: Contém componentes reutilizáveis compartilhados entre várias telas.
         - `controller/`: Contém o controller de login.
         - `component/`: Contém componentes reutilizáveis de login.
  - `main.dart`: Ponto de entrada do aplicativo.

- `test/src/view/login/page`: Contém os testes widget de login.
- `test/src/view/login/controller`: Contém os teste do controller de login.

## Tecnologias e Padrões Utilizados

### MobX

MobX é uma biblioteca de gerenciamento de estado que facilita o desenvolvimento de aplicativos Flutter ao permitir uma reatividade eficiente e fácil.

### SharedPreferences

SharedPreferences é usado para persistir dados localmente no dispositivo do usuário, permitindo armazenar configurações ou informações do usuário de forma persistente.

### HTTP

O pacote HTTP é utilizado para realizar requisições a uma Mock API, simulando a comunicação com um servidor remoto.

### Provider

Provider é uma biblioteca de injeção de dependência que facilita a organização e fornecimento de dependências no aplicativo.
### padroes de projetos
Durante o app foram usados conceitos de S.O.L.I.D  e padroes de projeto como o Adapter.



## Testes

O projeto contém testes de unidade e testes de widget para garantir que as diferentes partes do aplicativo funcionem conforme o esperado.

### Testes de Unidade

Os testes de unidade garantem que funções e métodos isolados do código funcionem conforme esperado, ajudando a manter a qualidade do código.

### Testes de Widget

Os testes de widget garantem que os componentes visuais e a interação entre eles estejam corretos. Isso é crucial para garantir que as telas do aplicativo se comportem conforme o esperado.

## Como Rodar o Projeto

1. Certifique-se de ter o Flutter instalado em sua máquina.
2. Clone este repositório: `git clone https://github.com/seu-usuario/seu-repositorio.git`
3. Navegue até o diretório do projeto: `cd seu-repositorio`
4. Execute o aplicativo: `flutter run`
