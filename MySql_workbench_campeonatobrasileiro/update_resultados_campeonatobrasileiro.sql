-- 01. Atualize na tabela evento as descrições 
-- DE "Substitution" PARA "Substituição"
-- DE "Woodwork" PARA "Bola na Trave"
-- DE "Cartão Vermelho (Second Yellow Card)" PARA "CCartão Vermelho (Segundo Cartão Amarelo)Segundo Cartão Amarelo)"
use campeonatobrasileiro;
select distinct descricao from evento order by descricao;
update evento
	set descricao = 'Substituição'
    where descricao = 'Substitution';

update evento
	set descricao = 'Bola na Trave'
    where descricao = 'Woodwork';
    
    update evento
	set descricao = 'Cartão Vermelho (Segundo Cartão Amarelo)'
    where descricao = 'Cartão Vermelho (Second Yellow Card)';
    
    
-- 02. Atualize o resultado das partidas do brasileirão 
-- que já aconteceram e ainda não foi gravado o resultado.
select * from vw_mandante
		union all
	  select * from vw_visitante;
      
    
    update partida
		set gol_mandante = 1, gol_visitante = 1
		where rodada = 35
        and id_mandante = 5
	    and id_visitante = 18;
        
	 update partida
		set gol_mandante = 0, gol_visitante = 1
		where rodada = 35
        and id_mandante = 1
	    and id_visitante = 16;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
		where rodada = 35
        and id_mandante = 13
	    and id_visitante = 9;
        
	update partida
		set gol_mandante = 2, gol_visitante = 2
		where rodada = 35
        and id_mandante = 19
	    and id_visitante = 3;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
		where rodada = 35
        and id_mandante = 4
	    and id_visitante = 2;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
		where rodada = 35
        and id_mandante = 15
	    and id_visitante = 17; 
        
	update partida
		set gol_mandante = 3, gol_visitante = 1
		where rodada = 35
        and id_mandante = 6
	    and id_visitante = 20;
        
	update partida
		set gol_mandante = 0, gol_visitante = 0
        where id_partida = 348;
        
	update partida
		set gol_mandante = 0, gol_visitante = 0
        where id_partida = 349;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
        where id_partida = 350;
        
	update partida
		set gol_mandante = 2, gol_visitante = 3
        where id_partida = 351;
        
	update partida
		set gol_mandante = 1, gol_visitante = 3
        where id_partida = 352;
        
	update partida
		set gol_mandante = 1, gol_visitante = 2
        where id_partida = 353;
        
	update partida
		set gol_mandante = 2, gol_visitante = 4
        where id_partida = 354;
        
	update partida
		set gol_mandante = 2, gol_visitante = 2
        where id_partida = 355;
        
	update partida
		set gol_mandante = 2, gol_visitante = 1
        where id_partida = 356;
	
    update partida
		set gol_mandante = 3, gol_visitante = 2
        where id_partida = 357;
        
	update partida
		set gol_mandante = 2, gol_visitante = 0
        where id_partida = 358;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
        where id_partida = 359;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
        where id_partida = 360;
        
	update partida
		set gol_mandante = 0, gol_visitante = 1
        where id_partida = 361;
        
	update partida
		set gol_mandante = 1, gol_visitante = 2
        where id_partida = 362;
        
	update partida
		set gol_mandante = 1, gol_visitante = 1
        where id_partida = 363;
        
select t.id_time,t.sigla,gol_mandante, gol_visitante, id_visitante,ti.sigla, id_partida, rodada
	from partida p 
    inner join time t
    on p.id_mandante = t.id_time
    inner join time ti
    on p.id_visitante = ti.id_time
    where gol_mandante is null
    order by rodada;
    
select t.id_time,t.sigla,gol_mandante, gol_visitante, id_visitante,ti.sigla, rodada
	from partida p 
    inner join time t
    on p.id_mandante = t.id_time
    inner join time ti
    on p.id_visitante = ti.id_time
    where rodada = 35
    order by rodada;
    
-- 03. Elabore um relatório por minuto e a quantidade de gols (não contar "Gol anulado (Var)")
-- e ordene pela quantidade do maior para o menor

-- 04. Elabore um relatório por idade e quantidade de jogadores

-- 05. Elabore um relatório por jogador e quantidade de cartões, 
-- detalhar também a quantidade de Cartões Vermelho e Amarelo
-- ordene pela quantidade total de Cartões'