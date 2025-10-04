-- Este arquivo contém as consultas SQL e a explicação da lógica para a Parte 2 do desafio.

-- Consulta 1: Ranking de Faturamento por Produto

-- LÓGICA DA CONSULTA:
-- 1. SELECT: Selecionamos as colunas 'Produto', 'Categoria' e criamos uma nova coluna calculada 'FaturamentoTotal'.
--    - 'FaturamentoTotal' é a soma (SUM) da multiplicação de 'Quantidade' por 'Preço' para cada grupo.
-- 2. FROM: Indicamos que os dados vêm da tabela 'Vendas'.
-- 3. GROUP BY: Agrupamos todas as linhas pelo 'Produto' e 'Categoria' para que a função SUM calcule o total para cada produto individualmente.
-- 4. ORDER BY: Ordenamos o resultado final pela coluna 'FaturamentoTotal' em ordem decrescente (DESC), colocando os mais vendidos no topo.

SELECT
    Produto,
    Categoria,
    SUM(Quantidade * Preco) AS FaturamentoTotal
FROM
    Vendas
GROUP BY
    Produto, Categoria
ORDER BY
    FaturamentoTotal DESC;

-- Consulta 2: Produtos com Menos Vendas em Junho de 2024

-- LÓGICA E SUPOSIÇÃO:
-- O enunciado pede uma análise para Junho de 2024, porém, nosso dataset simulado contém dados exclusivamente do ano de 2023.
-- A suposição adotada aqui é que a intenção era analisar o período correspondente disponível, ou seja, Junho de 2023.
-- 1. SELECT: Selecionamos o 'Produto' e calculamos o 'FaturamentoJunho' para cada um.
-- 2. FROM: Os dados vêm da tabela 'Vendas'.
-- 3. WHERE: Filtramos as vendas apenas para o mês de Junho de 2023. A função STRFTIME('%Y-%m', Data) extrai o ano e mês da data.
-- 4. GROUP BY: Agrupamos por 'Produto' para somar as vendas de cada produto dentro do mês filtrado.
-- 5. ORDER BY: Ordenamos o resultado pelo 'FaturamentoJunho' em ordem ascendente (ASC), colocando os produtos com as menores vendas no topo.

SELECT
    Produto,
    SUM(Quantidade * Preco) AS FaturamentoJunho
FROM
    Vendas
WHERE
    STRFTIME('%Y-%m', Data) = '2023-06'
GROUP BY
    Produto
ORDER BY
    FaturamentoJunho ASC;
