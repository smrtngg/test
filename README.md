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

## CI в pull request

Workflow `Run Check` запускает `Basic tests` при создании PR и после каждого нового commit.

Полный набор запускается вручную меткой `run-full-tests`. Workflow `Run Full Check` повторяет основной контур Kaiten:

- `Resolve service overrides` подготавливает запуск и снимает одноразовую метку;
- `Tests`, `Playwright` и `Kaiten Lite` запускаются параллельно после подготовки;
- checkout сохраняет credentials, как в текущем CI Kaiten;
- новый commit запускает `Run Check` и отменяет незавершённый `Run Full Check` через общую concurrency-группу;
- на новом SHA результаты предыдущего полного запуска не подходят для обязательных status checks.

В тестовом репозитории используются GitHub-hosted runners и ограниченный `GITHUB_TOKEN`. В Kaiten им соответствуют Kubernetes runners и `PAT`.
