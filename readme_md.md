# 📱 Atividade Telas - App de Mensagens (Flutter & Firebase)

Este repositório contém um aplicativo desenvolvido em **Flutter** (Dart) como atividade prática de navegação entre telas, componentização de widgets e integração com o banco de dados em nuvem **Cloud Firestore** (Firebase) para gerenciamento de mensagens.

---

## 🚀 Funcionalidades

- **Menu Principal (`menu.dart`):** Central de navegação entre as diferentes funcionalidades e telas do aplicativo.
- **Adicionar Mensagens (`tela_Adicionar.dart`):** Interface com formulários personalizados para criação e envio de novas mensagens.
- **Consulta e Listagem (`tela_consulta.dart` / `messageList.dart`):** Exibição dinâmica das mensagens cadastradas utilizando cartões estilizados (`messageCard.dart`).
- **Integração com Firebase (`messagesFirestore.dart`):** Persistência, leitura e manipulação de dados em tempo real utilizando o Cloud Firestore.
- **Componentização de UI (`widgets/`):** Reutilização de componentes visuais padronizados (botões, campos de entrada e textos).

---

## 📂 Estrutura do Projeto

A organização dos arquivos do projeto está dividida da seguinte forma:

```text
Android-Studio---Atividade-Telas-main/
├── main.dart                  # Ponto de entrada da aplicação e configurações iniciais
├── menu.dart                  # Tela principal com o menu de navegação
├── tela_Adicionar.dart        # Tela dedicada ao cadastro de novas mensagens
├── tela_consulta.dart         # Tela para visualização e consulta de mensagens
├── messageList.dart           # Componente responsável por renderizar a lista de mensagens
├── messageCard.dart           # Card visual individual para exibição de cada mensagem
├── messagesFirestore.dart     # Serviço de conexão e operações CRUD com o Cloud Firestore
├── models/
│   └── mensagens.dart         # Modelo de dados (Classe/Objeto) que representa uma mensagem
└── widgets/
    ├── widgetsButton.dart     # Componente customizado para botões
    ├── widgetsInput.dart      # Componente customizado para campos de texto (Inputs)
    └── widgetsTexto.dart      # Componente customizado para estilização de textos
```

---

## 🛠️ Tecnologias Utilizadas

- **[Flutter](https://flutter.dev/):** Framework multiplataforma para desenvolvimento mobile.
- **[Dart](https://dart.dev/):** Linguagem de programação utilizada no projeto.
- **[Firebase Cloud Firestore](https://firebase.google.com/docs/firestore):** Banco de dados NoSQL em nuvem para armazenamento das mensagens.
- **Android Studio / VS Code:** Ambientes de desenvolvimento.

---

## ⚙️ Como Executar o Projeto

### Pré-requisitos
- Ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado na máquina.
- Um emulador Android/iOS ou dispositivo físico conectado.
- Um projeto configurado no [Firebase Console](https://console.firebase.google.com/) (caso seja necessário vincular suas próprias credenciais `google-services.json` / `firebase_options.dart`).

### Passo a passo

1. **Clone este repositório:**
   ```bash
   git clone https://github.com/SEU-USUARIO/Android-Studio---Atividade-Telas.git
   ```

2. **Acesse a pasta do projeto:**
   ```bash
   cd Android-Studio---Atividade-Telas-main
   ```

3. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

---

## 📝 Notas

Este projeto foi desenvolvido com foco no aprendizado de arquitetura de telas, boas práticas de reutilização de código (através da pasta `widgets/` e `models/`) e consumo de serviços em nuvem no ecossistema Flutter.