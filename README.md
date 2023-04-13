# MPFlutter mini-app architecture

A mini app architecture for MPFlutter.

## Project Structure
```
|-- lib
    |-- main.dart
    |-- app
        |-- data
            |-- data_source
                |-- local
                    |-- token_local_data_source.dart
                |-- remote
                    |-- api
                        |-- api_service.dart
                    |-- base
                        |-- base_client.dart
                        |-- network_intercepstors.dart
            |-- models
                |-- base_reponse.dart
                |-- refresh_token_response.dart
                |-- rx_data_status.dart
            |-- repository
                |-- repo.dart
                |-- repo_impl.dart
            |-- services.dart
        |-- pages
            |-- home
            |-- page
                |-- controller
                |-- entity
                |-- screen
    |-- config
        |-- api_config.dart
    |-- constant
    |-- styles
        |-- colors.dart
        |-- styles.dart
    |-- utils
        |-- debounce.dart
        |-- jwt_decoder.dart
        |-- utils.dart
    |-- view
    |-- scripts
```

## Run project
#### Debug
Solution 1: Chose Run and Debug in VSCode
![image info](./assets/run_vscode.png)

![image info](./assets/debug_console.png)

Solution 2: Use terminal
```console
dart lib/main.dart
```
![image info](./assets/debug_terminal.png)

#### Build mpk
```console
dart scripts/build_mpk.dart
```
Output
![image info](./assets/mpk_output.png)
