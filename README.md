# Ash Index

**Ash Index** is a short melancholy 2D sidescroller prototype set in the **Aetherius** universe: catalog GINAI-scarred bunkers on Terra Primus with Empire surplus rifle and a relic-coupler that channels Cataclysm leftover Field — every pulse helps you survive and makes you complicit in the disaster you’re indexing.

This repository is the **Game Project** playable prototype (Godot 4). Level 1 WIP: linear bunker strip **Dust Mouth → Tithe Bay → Coupler Alcove → Ward Gallery → Scar Shaft → Extract Lock**.

## Engine

- **Godot 4.3+** (project features tagged `4.3`; open in current 4.x stable — e.g. 4.7.x — and accept any editor migration prompts)
- Main scene: `menus/start_menu.tscn`
- Pixel viewport: **320×180** (window override 1280×720)

Open `project.godot` in the Godot editor (Project Manager → Import, or drag the file onto the editor), then press **F5**.

## Level 1 WIP — what works

- Linear room doors (no open Metroid map)
- Surplus rifle (LMB) with finite ammo + pickups
- Relic-coupler (RMB) after Coupler Alcove — **slow pulse**; **Cognitive Bleed** meter (fail at 100)
- Index tags (F) — Tithe Bay, Ward Gallery, Scar Shaft (need 3 for extract)
- Extract Lock publish / redact stub endings
- Scavengers / ward-drones / one scar husk remix of seed enemies
- Muted greybox bunker look (placeholder art; MIT course sprites still used for actors)

## Controls

| Action | Default |
|--------|---------|
| Move | A/D or arrows |
| Jump | W / Up |
| Crouch / drop | S / Down |
| Surplus rifle | Mouse left |
| Relic-coupler pulse | Mouse right (after Coupler Alcove) |
| Tag index point | F (when prompted) |
| Pause | Esc / E |

## Attribution & license

Code and original course assets in this tree derive from [HeartBeast’s Metroidvania (Godot 4)](https://github.com/uheartbeast/metroidvania-godot-4) (Heart Gamedev LLC) under the **MIT License** — see [`LICENSE.txt`](LICENSE.txt) and [`ATTRIBUTION.md`](ATTRIBUTION.md). Keep those notices when redistributing.

Ash Index branding, pitch, and Aetherius setting direction are separate from the upstream sample content.
