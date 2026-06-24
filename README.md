# 🎮 Platformer Game - Godot 4.x

Un juego de plataforma profesional creado con Godot 4.x con todas las características esenciales.

## 🎯 Características

- ✅ Jugador con movimiento fluido y salto
- ✅ Gravedad realista y física mejorada
- ✅ Enemigos con IA inteligente
- ✅ Plataformas móviles y destructibles
- ✅ Sistema de recolección (monedas)
- ✅ Múltiples niveles
- ✅ UI completa (vidas, puntuación, menú)
- ✅ Efectos de partículas
- ✅ Cámara suave que sigue al jugador
- ✅ Sistema de audio

## 🕹️ Controles

- **A / Flecha Izquierda**: Mover izquierda
- **D / Flecha Derecha**: Mover derecha
- **W / Espacio**: Saltar
- **ESC**: Menú pausa

## 📁 Estructura del Proyecto

```
jueguito/
├── scenes/
│   ├── levels/
│   │   ├── level_1.tscn
│   │   └── level_2.tscn
│   ├── player/
│   │   └── player.tscn
│   ├── enemies/
│   │   ├── walker.tscn
│   │   └── flyer.tscn
│   ├── ui/
│   │   ├── hud.tscn
│   │   └── menu.tscn
│   └── items/
│       └── coin.tscn
├── scripts/
│   ├── player.gd
│   ├── enemy_walker.gd
│   ├── enemy_flyer.gd
│   ├── level_manager.gd
│   ├── game_manager.gd
│   └── camera_controller.gd
├── assets/
│   ├── sprites/
│   ├── sounds/
│   └── music/
└── project.godot
```

## 🚀 Cómo empezar

1. Abre Godot 4.x
2. Abre el proyecto
3. Presiona F5 o click en Play
4. ¡Disfruta!

## 📝 Desarrollo

Para agregar nuevos niveles:
1. Duplica `level_1.tscn`
2. Modifica los enemigos y plataformas
3. Actualiza `game_manager.gd` con la nueva escena

## 🎨 Personalización

Todos los valores son ajustables:
- Velocidad del jugador
- Altura del salto
- Velocidad de enemigos
- Dificultad de niveles

---

**¡Hecho con ❤️ en Godot 4.x!**
