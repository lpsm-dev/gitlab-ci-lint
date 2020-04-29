# Ruby Sub and Gsub - Replace String

Em Ruby, quando estamos falando da classe String, no geral, podemos fazer o replace do conteúdo de uma string de duas formas:

* Utilizando o método sub().
* Utilizando o método gsub().

Expressões Regulares também são utilizadas, porém para casos um pouco mais complexos.

## Description

Portanto, as substituições de string podem ser feitas com os métodos sub() e gsub(). Eles são métodos de substituição da classe String. A grande diferença entre os dois é que o gsub() aplicará a substituição globalmente.

Nesses métodos podemos utilizar Expressões Regulares ou Strings como argumentos.

## Exemples

Vamos iniciar com um exemplo. Usamos o sub! para substituirmos inline e o sub para substituir retornando uma outra string. Nessa chamadas o primeiro argumento é substituído pelo segundo.

```ruby
animal = "gato"

# Replace string at with ote.
animal.sub!("at", "ote")
puts animal

animal = "passarinho"

# This version of sub does not change the string in-place.
animal = animal.sub("inho", "ado")
puts animal
```

## Gsub and Sub

O método sub() substitui apenas a primeira instância de uma string por outra. Enquanto isso, o gsub, substitui todas as instâncias.

Assim, o gsub() é mais próximo de um método replace string. Sub é conceitualmente um mpetodo de substituir a primeira string.

```ruby
value = "abc abc"
puts value

# Sub replaces just the first instance.
value = value.sub("abc", "---")
puts value

# Gsub replaces all instances.
value = value.gsub("abc", "---")
puts value
```

## Substring

Podemos atribuir uma substring dentro de uma string. Essa sintaxe tem o mesmo efeito de chamar o método sub em uma string. Irá ser substituído apenas a primeira ocorrência.

Dicas: Expressões Regulares, intervalos e índices podem ser usados. A atribuição de substring é versátil e fácil de executar.

```ruby
value = "abc abc"
puts value

# A substring can be changed within a string.
# ... Only the first instance is replaced.
value["abc"] = "def"
puts value
```

## Regex - Sub

Podemos especificar uma Regex como primeiro argumento para sub() e gsub(). Qualquer metacaractere de expressão regular pode ser utilizado aqui.

```ruby
value = "cat and dog"

# Replaced at a matching the regexp with another string.
value.sub!(/c\w\w/, "bird")
puts value
```

Regexp pattern:

* c    The lowercase letter "c".
* \w   A word character (letter or digit).

## Regex - Gsub

O método gsub também pode ser utilizado com expressão regular. Ao contrário do sub, ele irá substituir todas as ocorrências.

```ruby
value = "quickly, slowly or happily"

# Replace all word sending with "ly" with a string.
value.gsub!(/\w+ly/, "REP")
puts value
```

Regexp pattern:


Ruby program that uses gsub with regexp

value = "quickly, slowly or happily"

# Replace all word sending with "ly" with a string.
value.gsub!(/\w+ly/, "REP")
puts value

Output

REP, REP or REP

Regexp pattern

* \w+    One or more word characters.
* ly     The lowercase substring "ly".

## Methods Block

Os métodos sub e gsub podem ser usados com blocos de métodos.

```ruby
value = "bird and fish"

# Replace all four-letter words with an uppercase version.
value.gsub!(/\w{4}/) {|word| "[" + word.upcase() + "]"}
puts value
```
