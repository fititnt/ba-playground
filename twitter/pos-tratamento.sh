# Comandos executados no pos tratamento de arquivos

# Concatenar
cat arquivo1.json arquivo2.json > concatenado.json

# Pre-ordena arquivos
sort -S 12G NEDvsARG_original.json -o NEDvsARG_sorted.json
#real	10m28.689s
#user	3m13.827s
#sys	1m12.377s

# Apenas linhas únicas no arquivo (remove duplicadas, requer arquivo pré-ordenado)
uniq NEDvsARG_sorted.json NEDvsARG_uniq_v2.json
#real	4m52.960s
#user	0m50.143s
#sys	0m21.743s

# Gerar CSV, com alguns campos especificos selecionados
twitter_to_csv --csv twitter_2014-06-09_arg-vs-ned.csv --fields id,created_at,user.id,user.screen_name,lang,text,retweeted_status.id  --replay-from-file twitter_2014-06-09_arg-vs-ned.json