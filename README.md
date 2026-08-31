# Fichas de desmontaje

Aplicación Flutter offline para documentar el desmontaje y diagnóstico de
relojes mecánicos en una Samsung Galaxy Tab A SM-T580.

## Entorno fijado

- Flutter 3.47.2 / Dart 3.13.2.
- Android `minSdk` 27 (Android 8.1).
- Java 17.
- Identificador Android: `es.relojeria.fichasdesmontaje`.

## Estructura

El código se organiza por funcionalidades. Cada funcionalidad separará dominio,
casos de uso, infraestructura y presentación cuando esas capas aporten una
frontera real de negocio o de entrada/salida.

## Verificación local

```bash
flutter analyze
flutter test
flutter build apk --debug
```
