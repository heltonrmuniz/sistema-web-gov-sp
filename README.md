# Sistema Web – Governo do Estado de São Paulo

![Status](https://img.shields.io/badge/status-concluído-brightgreen)
![Python](https://img.shields.io/badge/ASP-Legacy-blue)

## 📝 Descrição do Projeto

Sistema web desenvolvido para uso interno de um órgão do Governo de SP, com interface em ASP, HTML, CSS e integração com **Google Charts** para geração de gráficos dinâmicos a partir de um banco de dados **SQL Server** local.

## 🎯 Funcionalidades

- Interface web responsiva e intuitiva
- Integração com banco de dados SQL Server
- Geração de gráficos dinâmicos com Google Charts
- Consulta e visualização de dados internos

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Descrição |
|------------|-----------|
| ASP | Lógica de backend e conexão com banco |
| HTML/CSS | Interface e estilização |
| Google Charts | Visualização de dados em gráficos |
| SQL Server | Banco de dados relacional local |

## 📂 Estrutura do Projeto
sistema-web-gov-sp/
├── index.asp # Página principal
├── style.css # Estilos
└── database/
└── schema.sql # Estrutura do banco


## 💻 Como Executar (para quem for testar)

1. Instalar SQL Server LocalDB
2. Executar o script `database/schema.sql`
3. Configurar a string de conexão no `index.asp`
4. Publicar no IIS

## 👤 Autor

**Helton Muniz** – Analista de Sistemas em transição para desenvolvimento

[LinkedIn](https://www.linkedin.com/in/helton-muniz-9b3044411/) | [GitHub](https://github.com/tisegroot-ctrl)

## 📜 Licença

Este projeto foi desenvolvido para uso interno do Governo de SP e não possui licença de uso público.
