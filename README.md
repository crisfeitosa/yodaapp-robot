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
- Appium 2 instalado globalmente ou via `npx`

## Instalação

1. Instale as dependências do projeto:

   ```bash
   npm install
   ```

2. Instale o Appium na versão usada pelo projeto:

   ```bash
   npm i appium@2.0.1
   ```

3. Instale o driver Android do Appium:

   ```bash
   npx appium driver install uiautomator2@2.0.5
   ```

4. Inicie o servidor do Appium:

   ```bash
   npx appium
   ```

## Execucao dos testes

Com o Appium em execucao, rode a suite Robot Framework:

```bash
robot -d ./logs tests/home.robot
```

Esse comando gera os artefatos de execucao em `logs/`:

- `logs/output.xml`
- `logs/log.html`
- `logs/report.html`

## Sobre esses comandos

- `npm i appium@2.0.1` instala o Appium 2 no projeto, garantindo uma versão fixa.
- `npx appium driver install uiautomator2@2.0.5` instala o driver Android compatível com o Appium 2.
- `npx appium` sobe o servidor para que os testes possam se conectar.

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
   home.robot
package.json
README.md
```

## Próximos passos

Expandir a suite atual com novos cenarios e centralizar a execucao em scripts no `package.json`.

## Observações

O script `npm test` ainda está como placeholder e não executa os testes Robot Framework.
