Vou mostrar como instalar o [Node.js](http://nodejs.org) latest (no meu caso a **v0.12**) na [Raspberry Pi](http://www.raspberrypi.org) de forma bem simples.

## Instalando a versão antiga (0.6)

A versão que está disponibilizada no apt-get por padrão é muito antiga, muito antiga mesmo. É a versão **0.6**

Para instalar esta versão basta executar o comando:

```bash
$ apt-get install nodejs
```

## Instalando o Node.js Latest (0.12.*)

##### Primeiro vamos fazer o download do **tar.gz** do Node.js latest:

```bash
$ wget http://node-arm.herokuapp.com/node_latest_armhf.deb
```

##### Agora vamos iniciar a instalação:

```bash
$ sudo dpkg -i node_latest_armhf.deb
```

## Testando a versão do Node.js e do NPM

Para verificar a versão do Node.js basta executar o comando:

```bash
$ node -v
```

deve responder algo como **v0.12.xx**

```bash
$ npm -v
```

deve responder algo como **2.5.1**

Pronto agora você já tem a última versão do **Node.js** instalado na sua **Raspberry Pi** e você já pode começar a programar!

