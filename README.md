# GaiaWeb

Website to talk about Gaia

## How to use

It's highly recommended to use it with docker, though raw swift 4.2 must work too.

### Using Docker

You can easily build your project with bash scripts in `./bin`. To build the project, go on project directory and simply run

```bash
bash bin/build
```

You might have preferences on how your docker run, but you will find default bash scripts :

```bash
bash bin/run:dev [port]
```

port is optional, by default it is 80. `run:dev` links volumes public and Views so you can work on your HTML page without having to rebuild docker and project.

```bash
bash bin/run:prod
```

Run the docker using your port 80 in a closed environment. Will be use in production.

### Using Swift
You can load the librairies and create a xcode project by running 

```bash
swift package generate-xcodeproj
```

Then you can build your app with 

```bash
swift build [-c release]
```

By default you are in dev mode

Then just execute the link provided to run you server on port 80

```bash
./.build/x86_64-apple-macosx10.10/debug/GaiaWeb
```

If you want to change port, you can do it in `Sources/GaiaWeb/main.swift`
