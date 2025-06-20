@echo off
title Gestor de Servicos do Windows Update
color 1F

echo.
echo ==============================================
echo     UTILITARIO DE CONTROLO WINDOWS UPDATE
echo ==============================================
echo.
echo Este utilitario permite PARAR ou INICIAR os servicos
echo essenciais do Windows Update para fins de manutencao,
echo controlo em ambientes de exame, ou resolucao de erros.
echo.
echo Opcoes disponiveis:
echo [1] Parar os servicos de atualizacao
echo [2] Iniciar os servicos de atualizacao
echo.

set /p opcao=Escolha uma opcao [1 ou 2]: 

if "%opcao%"=="1" goto PARAR
if "%opcao%"=="2" goto INICIAR
goto ERRO

:PARAR
echo.
echo A parar os servicos do Windows Update...
echo ------------------------------------------
net stop wuauserv
net stop bits
net stop dosvc
net stop usosvc
net stop WaaSMedicSvc
echo.
echo ✅ Todos os servicos foram PARADOS com sucesso.
goto FIM

:INICIAR
echo.
echo A iniciar os servicos do Windows Update...
echo --------------------------------------------
net start wuauserv
net start bits
net start dosvc
net start usosvc
net start WaaSMedicSvc
echo.
echo ✅ Todos os servicos foram INICIADOS com sucesso.
goto FIM

:ERRO
echo.
echo ❌ Opcao invalida! Por favor execute novamente e escolha 1 ou 2.
goto FIM

:FIM
echo.
echo Prima qualquer tecla para sair...
pause > nul
