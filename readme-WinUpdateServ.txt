ReadMe: UTILITARIO DE CONTROLO WINDOWS UPDATE
Versão: 1.0
Data: junho de 2025

Descrição Geral:

Este utilitário em formato batch script foi desenvolvido para facilitar o controlo manual dos principais serviços do Windows Update, especialmente em contextos como:

- Sessões de exame onde é necessário evitar atualizações automáticas;
- Diagnóstico e resolução de problemas relacionados com o Windows Update;
- Manutenção temporária de sistemas Windows.

⚙️ Funcionalidades

O programa permite duas operações principais:

1. Parar os serviços de atualização:
   Esta opção interrompe os seguintes serviços do sistema:
   - wuauserv (Windows Update)
   - bits (Serviço de Transferência Inteligente em Segundo Plano)
   - dosvc (Otimização de Entrega)
   - usosvc (Orquestrador de Atualizações)
   - WaaSMedicSvc (Serviço de Reparação do Windows Update)

2. Iniciar os serviços de atualização:
   Reinicia os serviços acima, restaurando o funcionamento normal do sistema de atualizações automáticas.

🛠️ Utilização

1. Executar o ficheiro como Administrador (clique com o botão direito do rato e escolha "Executar como administrador");
2. Selecionar a opção desejada:
   - [1] para Parar os serviços
   - [2] para Iniciar os serviços
3. O programa mostra o progresso no ecrã e aguarda o pressionar de uma tecla para encerrar.

⚠️ Notas Importantes

- O programa não desativa permanentemente os serviços — apenas os interrompe ou reinicia durante a sessão atual;
- É imprescindível correr este ficheiro com privilégios de administrador, caso contrário os comandos falharão.

👨‍💻 Autor

João Hilário
Utilitário desenvolvido para fins educativos e operacionais em ambiente de TI escolares.

📄 Licença

UTILITARIO DE CONTROLO WINDOWS UPDATE  © 2025 by Joao Hilario is licensed under CC BY-NC-SA 4.0.
To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/
