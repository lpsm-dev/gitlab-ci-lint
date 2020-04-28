# Rake

O Rake é um popular corredor de tarefas em Ruby.

## What's a task?

Uma tarefá pode ser:

* Executar testes.
* Estatísticas de coleta e geração de relatórios.
* Fazer backup do banco de dados.

Esses são pequenos exemplos de tarefas que, sem o Rake, seriam espalhadas por todo seu projeto em arquivos diferentes.

## Description

O que é Rake? Basicamente o Rake é um gerenciador de tarefas e dependência descrito em Ruby.

Podemos compará-lo como sendo uma alternativa ao Makefile, porém com a sintaxe em Ruby.

O Rake irá centralizar o acesso ás nossas tarefas. Ele também facilita algumas coisas, como encontrar arquivos que correspondam a um determinado padrão e que foram modificados recentemente.

## Observation

Não confunda Rake com Rack, apesar de serem nomes semelhantes, representam coisas completamente diferentes.

* Rake:
  * É um corredor de tarfas.
* Rack:
  * Ajuda servidores e estruturas em Ruby a trabalharem em conjunto.

## Who Uses Rake?

O cara mais famoso é o Rails. Se você já fez alguma coisa com o Rails, provavelmente está familiarizado com o rake db:migrate. O rake entra em ação aqui. Desde a versão 5.0 o Rails permite chamar a maioria dos comandos rake.

## Rake Task Exemple

```ruby
desc "Description task."

task :apple do
  puts "Eat more apples!"
end
```
