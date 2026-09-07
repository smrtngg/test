# Тестовый репозиторий GitHub Actions

Репозиторий содержит минимальную CLI-команду для проверки сценария с базовыми и полными тестами в pull request.

```console
$ ./bin/greet Developer
Hello, Developer!
```

Базовая проверка:

```sh
./tests/basic.sh
```

Полный набор, включающий обработку ошибочных аргументов:

```sh
./tests/full.sh
```
