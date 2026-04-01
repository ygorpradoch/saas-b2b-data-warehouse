# 📊 Pipeline de Dados End-to-End & BI: B2B SaaS Analytics

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-005C84?style=for-the-badge&logo=microsoft&logoColor=white)

## 📌 1. Visão Geral e Problema de Negócio
No setor de Software as a Service (SaaS) B2B, monitorar a receita recorrente e a retenção de clientes é a espinha dorsal da operação. O desafio é que dados transacionais, status de assinaturas e histórico de pagamentos costumam ficar dispersos em diferentes bancos de dados de produção, dificultando a visão em tempo real da saúde financeira da empresa pela diretoria.

**O Objetivo:** Construir uma arquitetura de dados completa (end-to-end) do zero para simular um ambiente SaaS real. Este projeto gera dados de negócios sintéticos, processa-os através de um pipeline ETL para um Data Warehouse relacional e fornece insights acionáveis por meio de um dashboard de Business Intelligence interativo e de nível executivo.

**Principais Métricas de Negócio Monitoradas:**
* **MRR (Receita Mensal Recorrente):** Previsibilidade de fluxo de caixa.
* **Taxa de Churn:** Monitoramento da evasão e cancelamento de clientes.
* **Inadimplência:** Rastreamento de falhas e atrasos de pagamento.
* **ICP (Perfil de Cliente Ideal):** Distribuição de receita por setor da indústria e porte da empresa.

---

## 🏗️ 2. Arquitetura e Fluxo de Dados

![Diagrama da Arquitetura Placeholder](https://github.com/user-attachments/assets/94d31927-f11a-4171-aee6-16903d7092a5)

1.  **Geração de Dados (Python):** Desenvolvimento de um script utilizando a biblioteca `Faker` para gerar bases de dados realistas e aleatórias simulando 3 anos de operação (Clientes, Planos, Assinaturas e Pagamentos), incluindo regras lógicas de negócios (ex: atrasos de pagamento e taxas controladas de falha).
2.  **Data Warehouse (MySQL):** Modelagem de um banco de dados relacional otimizado para consultas analíticas.
3.  **Pipeline ETL (Python/Pandas):** Construção de um pipeline para extrair os dados gerados, transformá-los (limpeza e formatação) e carregá-los no banco MySQL utilizando técnicas de processamento em lotes (*chunking*) para lidar com grandes volumes com eficiência.
4.  **Visualização de Dados (Power BI):** Conexão direta ao banco MySQL, modelagem dos dados utilizando *Star Schema* (Esquema Estrela) e desenvolvimento de medidas DAX avançadas para construir um painel interativo focado em UI/UX.

---

## 🗄️ 3. Modelagem de Dados

O Data Warehouse foi estruturado utilizando a metodologia *Star Schema* para garantir alta performance nas agregações do Power BI.

* **Tabelas Fato:** `fact_subscriptions` (rastreia status de ativação/cancelamento), `fact_payments` (rastreia transações financeiras).
* **Tabelas Dimensão:** `dim_customers` (detalhes das empresas), `dim_plans` (níveis de produto), `dim_calendar` (inteligência de tempo).

![Placeholder do Modelo de Dados](https://github.com/user-attachments/assets/a62c2527-c961-4a91-a0c9-0b85492a8372)

---

## 📈 4. Dashboard e Insights Executivos

O dashboard foi projetado com uma estética "Dark Mode", priorizando o conforto cognitivo, a redução de ruído visual e uma hierarquia de dados clara. Ele conta com menu de navegação lateral, segmentadores globais dinâmicos e *tooltips* customizadas para uma melhor experiência do usuário (UX).
[ver dashboard completo](https://app.powerbi.com/view?r=eyJrIjoiYWI5NTdiOTctZDg0Ny00NzM4LWI5NDktZWMzZDlhZTc4NGI5IiwidCI6ImIxNTZhNTQxLWUyMzYtNGVkYi05MWJmLWZjYTI1YzcwMDRmOSJ9)

### Página 1: Visão Executiva
Fornece um panorama de alto nível da saúde financeira da empresa e do desempenho dos produtos ao longo do tempo.
![Placeholder da Visão Geral](https://github.com/user-attachments/assets/a880ce41-4de1-4c68-bca5-6879caf8f7e0)

### Página 2: Detalhamento de Clientes (Drill-Down)
Atua como um mini-CRM para a equipe de Customer Success, contando com barra de pesquisa, formatação condicional para contas canceladas e barras de dados visuais para identificação rápida dos maiores contratos (MRR).
![Placeholder do Detalhamento](https://github.com/user-attachments/assets/a145bd05-032c-4a62-92ad-118da1b43c45)

*Desenvolvido por Ygor - Conecte-se comigo no [LinkedIn](www.linkedin.com/in/ygor-prado-chagas).*
