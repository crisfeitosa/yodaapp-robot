# YodaAppRobot

Projeto de testes automatizados para mobile com [Appium](https://appium.io/).

## Visão geral

Este repositório contém a base para automação de testes mobile da aplicação Yodapp. O APK de teste está disponível em `app/yodapp-beta.apk`.

## Pré-requisitos

- Node.js 16+ ou superior
- npm
- Java JDK instalado e configurado
- Android Studio com Android SDK
- Emulador Android ou dispositivo físico conectado
- Appium 2 instalado no projeto (via npm)

## Instalação

1. Instale as dependências do projeto:

   ```bash
   npm install
   ```

2. Inicie o servidor do Appium:

   ```bash
   npx appium
   ```

As versões usadas atualmente estão no `package.json`:

- `appium`: `^2.19.0`
- `appium-uiautomator2-driver`: `^2.45.1`

## Execucao dos testes

Com o Appium em execucao, rode a suite Robot Framework:

```bash
robot -d ./logs tests/home.robot
```

Para executar o cenário de clique:

```bash
robot -d ./logs tests/click.robot
```

Esse comando gera os artefatos de execucao em `logs/`:

- `logs/output.xml`
- `logs/log.html`
- `logs/report.html`

## Sobre esses comandos

- `npm install` instala Appium e o driver UiAutomator2 definidos no projeto.
- `npx appium` sobe o servidor para que os testes possam se conectar.
- `robot -d ./logs <arquivo.robot>` executa os testes e gera os relatórios em `logs/`.

## Appium Inspector

Use esta configuração no Appium Inspector para abrir o APK no emulador Android:

```json
{
  "platformName": "Android",
  "appium:deviceName": "Android Emulator",
  "appium:automationName": "UIAutomator2",
  "appium:app": "<CAMINHO_DO_PROJETO>/app/yodapp-beta.apk",
  "appium:udid": "emulator-5554",
  "appium:autoGrantPermissions": true
}
```

Substitua `<CAMINHO_DO_PROJETO>` pelo caminho onde voce clonou o repositorio na sua maquina.

## Estrutura

```text
app/
  yodapp-beta.apk
logs/
   log.html
   output.xml
   report.html
tests/
   click.robot
   home.robot
package.json
README.md
```

## Próximos passos

Expandir a suite atual com novos cenarios e centralizar a execucao em scripts no `package.json`.

## Observações

O script `npm test` ainda está como placeholder e não executa os testes Robot Framework.

## Troubleshooting

- `EADDRINUSE: address already in use 0.0.0.0:4723`:
  existe outra instância do Appium rodando. Finalize a instância atual ou suba em outra porta:

  ```bash
  npx appium -p 4725
  ```

- `NotOpenSSLWarning` (urllib3/LibreSSL no macOS):
  é um warning do ambiente Python local. Não necessariamente bloqueia a execução dos testes, mas pode ser eliminado usando Python com OpenSSL 1.1.1+.
