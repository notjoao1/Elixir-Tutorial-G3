# Actor Model

- Modelo conceptual de computação concurrencial
- Tem como principal entidade um "Actor".

## Actor Actions

- Criar outro actor
- Enviar uma mensagem para outro actor
- Receber mensagem de outro actor



## A BEAM VM implementa actors sobre a forma de processos internos

- Não sao os processos tipicos do OS, mas sim processos da BEAM VM.

- São muito leves e não há grande overhead em criar novos processos

- É comum em sistemas de alta escala haverem milhões de processos a correr na BEAM VM



## Actor Propriedades

- Completamente isolados de outros actors, não há shared memory
- Podem ou não ter o seu estado interno individual
- Têm uma "caixa de correio" para receber as mensagens de outros actors, como um message queue



# Fault tolerance


- Actors podem ser supervisores de outros actors
- Podem receber mensagens relacionadas a falhas na execução de outros actors
- A falha de um actor não implica a falha de outros, pois são processos isolados
- Normalmente os sistemas em Elixir são desenvolvidos com o mindset de "Let it fail", ao invés de programar defensivamente com deteção de erros:
    - O supervisor fica à espera de um processo lhe avisar com uma mensagem que foi abaixo, e depois pode dar handle dessa falha como deseja: criar novo processo para fazer uma certa task, passar essa task a outro processo existente, ou descartar task.

# SLIDE SOBRE ISTO
É impossível prever todos os erros, por isso isto foi desenvolvido com uma filosofia orientada para a recuperação quando erros ocorrem -> "Let it fail!" recover gracefully instead of preventing errors

# SLIDE SOBRE ISTO
supervisores para fault tolerance