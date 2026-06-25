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
  "appium:app": "/Users/cristianofeitosa/Documents/Projects/udemy/QAx/yodaapp-robot/app/yodapp-beta.apk",
  "appium:udid": "emulator-5554",
  "appium:autoGrantPermissions": true
}
```

## Estrutura

```text
app/
  yodapp-beta.apk
package.json
```

## Próximos passos

Este projeto ainda não possui suíte de testes implementada. Você pode adicionar a estrutura de testes e scripts no `package.json` conforme a evolução da automação.

## Observações

O script `npm test` ainda está como placeholder e não executa testes reais.
