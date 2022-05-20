-- query 1 - Qual é o tempo médio de permanência de um colaborador na empresa, por cargo?
SELECT AVG(TIMESTAMPDIFF(MONTH,`Data Contratacao`,`Data Saida`)) as MediaDeTempoEmMeses, `Cargo Atual` 
FROM mydb.colaborador where `Data Saida` is not null group by `Cargo Atual`;



-- query 2 - Quais são os 10 Gestores que apresenta maior quantidade de ocorrência de demissão? 
SELECT fc.GESTORES_ID, ge.Nome , count(fc.`Tipo Ocorrencia`) as NumeroDemissao
    FROM mydb.fatoocorrencia as fc 
        inner join mydb.gestor as ge
        on fc.GESTORES_ID = ge.ID 
        where fc.`Tipo Ocorrencia` = 'demissao'
group by fc.GESTORES_ID order by NumeroDemissao DESC limit 10



-- query 3 - Quais são as 3 Filiais que apresenta maior quantidade de ocorrência de demissão?  
SELECT fc.FILIAL_ID, fi.Nome as NomeFilial, count(fc.`Tipo Ocorrencia`) as NumeroDemissao
	FROM mydb.fatoocorrencia as fc 
		inner join mydb.filial as fi
		on fc.FILIAL_ID = fi.ID 
        where fc.`Tipo Ocorrencia` = 'demissao'
group by fi.ID order by NumeroDemissao DESC limit 3



-- query 4 - Quais os 5 cargos que mais apresentam ocorrências de denúncia/advertência?
SELECT fc.CARGO_ID, ca.Nome as NomeCargo , count(fc.`Tipo Ocorrencia`) as NumeroDemissao
	FROM mydb.fatoocorrencia as fc 
		inner join mydb.cargo as ca
		on fc.FILIAL_ID = ca.ID 
        where fc.`Tipo Ocorrencia` = 'demissao' or fc.`Tipo Ocorrencia` = 'advertencia'
group by ca.ID order by NumeroDemissao DESC limit 5 