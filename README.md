## Exercício 1

[![Maintainability](https://api.codeclimate.com/v1/badges/e00d6334c379746ae76e/maintainability)](https://codeclimate.com/github/pecavalheiro/max-subarray-sum/maintainability)

### Descrição
Dado um conjunto de números, descobrir o subconjunto em que a soma dos elementos são de máxima soma.

Exemplo: dado o conjunto de elementos

[2, -4, 6, 8, -10, 100, -6, 5]

O subconjunto de soma máxima é:

[2, -4, **6, 8, -10, 100**, -6, 5]

Assim, o programa deve retornar a posição do primeiro e do último elemento da subcadeia.

Neste exemplo, as posições 2 e 5, considerando a primeira posição com índice 0.

#### Suposições
- O algoritmo aceita apenas numeros inteiros (array com float retorna nil).
- O algoritmo recebe apenas 1 (um) array por vez.
- Arrays vazios retornam nil.
- Arrays contendo strings retornam nil.

#### Descrição da solução
O algoritmo de Kadane foi usado para descobrir o subconjunto de maior soma,
sendo pequenas alterações realizadas para gravar o índice do subconjunto. A 
escolha do algoritmo se deu devido ao seu nível de performance (O(n)) em 
comparação aos outros algoritmos conhecidos.

#### Dependências
* [Ruby 2.4.0](https://www.ruby-lang.org)
* [Bundler](http://bundler.io/)

#### Instruções de uso
A classe responsável pelo algoritmo está em `lib/kadane/max_subarray_sum.rb`.
Para executá-la via bash, edite o arquivo input.csv de acordo com os dados de 
entrada desejados (cada linha corresponde a um array), e execute o seguinte 
comando:

```bash
> ruby max_subarray_sum_indexes.rb
```

O resultado de cada linha será impresso em seguida.

#### Testes

A biblioteca [RSpec](http://rspec.info/) é usada para testes
unitários, sendo que todos os testes se encontram dentro de `/spec`. Para
instalar todas as dependências e rodar os testes, execute os seguintes comandos:

```
bundle
rspec
```

