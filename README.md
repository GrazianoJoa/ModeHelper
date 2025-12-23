# ModeHelper
A keybinding cheatsheet for VIM
# Vim Mode Helper

Un pequeño plugin para **Vim 8** que muestra un **popup contextual con ayuda sobre los modos** (`Normal`, `Insert`, `Visual`).  
Ideal para principiantes o para refrescar atajos de teclado mientras editas.

---

## Características

- Muestra un **popup en la esquina superior derecha** con información del modo actual.
- Soporta los modos:
  - Normal
  - Insert
  - Visual
- Se actualiza automáticamente al cambiar de modo.
- Se puede **activar o desactivar** con un toggle.
- Popup estable: ancho fijo, texto ajustado, no se rompe con cambios de ventana.

---

## Instalación

### Usando [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'tu-usuario/vim-mode-helper'
