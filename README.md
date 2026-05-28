# Sistema de Estoque – (Governo de SP)

## 📝 Descrição

Sistema web para controle de estoque de produtos e alimentos, desenvolvido para a Secretarias do Estado de São Paulo.

## 🎯 Funcionalidades

- Cadastro de produtos (estocáveis, perecíveis, hortifruti, escritório, limpeza, kits, vestuário, utensílios)
- Controle de entradas e baixas de estoque
- Monitoramento de vencimentos (já vencidos, até 1 mês, 1-3 meses, 3-6 meses, acima de 6 meses)
- Previsões mensal, bimestral e trimestral
- Geração de romaneios e relatórios em PDF
- Pesquisa de produtos, estoques e vencimentos

## 🛠️ Tecnologias

| Tecnologia | Uso |
|------------|-----|
| ASP Clássico | Backend e lógica de negócio |
| SQL Server | Banco de dados |
| HTML/CSS | Interface e estilização |
| JavaScript | Menus interativos (SpryMenuBar) |

## 📂 Estrutura do Projeto

```plaintext
sistema-web-gov-sp/
│
├── index.asp                     # Página inicial com dashboard
├── bib_conn.asp                  # Conexão com banco de dados
├── produto_incluir.asp           # Cadastro de produtos
├── produto_estoque_entrada.asp   # Controle de entradas
│
├── css/
│   ├── footer.css
│   └── SpryMenuBarVertical.css
│
├── js/
│   └── SpryMenuBar.js
│
├── imagens/
│   ├── Logo_Brasao.jpg
│   └── icone_cadastro.png
│
└── database/
    └── schema.sql                # Estrutura do banco de dados


## 🔧 Como executar (para avaliação)

1. Instalar IIS no Windows
2. Configurar banco SQL Server
3. Executar o script `database/schema.sql`
4. Configurar a string de conexão em `bib_conn.asp`
5. Publicar no IIS


## 👤 Autor

**Helton Muniz** – Analista de Sistemas em transição para desenvolvimento

[LinkedIn](https://www.linkedin.com/in/helton-muniz-9b3044411/) | [GitHub](https://github.com/tisegroot-ctrl)

## 📜 Licença

Este projeto foi desenvolvido para uso interno do Governo de SP e não possui licença de uso público.
