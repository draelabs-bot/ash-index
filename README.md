# Ash Index

**Ash Index** is a short melancholy 2D sidescroller prototype set in the **Aetherius** universe: catalog GINAI-scarred bunkers on Terra Primus with Empire surplus rifle and a relic-coupler that channels Cataclysm leftover Field — every pulse helps you survive and makes you complicit in the disaster you’re indexing.

This repository is the **Game Project** playable prototype (Godot 4). Design target: one 5–10 minute Level 1 (**Dust Mouth → Extract Lock**) that proves hybrid combat, the index verb, and Cognitive Bleed cost. See the Project MVP doc in the Game Project Context for the locked design.

## Engine

- **Godot 4.3+** (project features tagged `4.3`; open in current 4.x stable — e.g. 4.7.x — and accept any editor migration prompts)
- Main scene: `menus/start_menu.tscn`
- Pixel viewport: **320×180** (window override 1280×720)

Open `project.godot` in the Godot editor (Project Manager → Import, or drag the file onto the editor).

## What’s here now

Vendored starting systems from [HeartBeast’s Metroidvania (Godot 4)](https://github.com/uheartbeast/metroidvania-godot-4) (MIT): room/door flow, blaster + secondary fire, HP UI, enemies, pause/menus. Course/1-bit art and Metroidvania extras (saves, upgrades, map weight) are **placeholders** to re-skin and strip for Ash Index Level 1 — not shipping art or final lore.

## Attribution & license

Code and original course assets in this tree derive from HeartBeast / Heart Gamedev LLC under the **MIT License** — see [`LICENSE.txt`](LICENSE.txt) and [`ATTRIBUTION.md`](ATTRIBUTION.md). Keep those notices when redistributing.

## Controls (base template)

| Action | Default |
|--------|---------|
| Move | A/D or arrows |
| Jump | W / Up |
| Crouch | S / Down |
| Fire (primary) | Mouse left |
| Secondary fire | (see project input map — maps later to relic-coupler) |
| Pause | Esc / E |

## Next (not in this seed)

Rebuild the linear bunker strip (Dust Mouth → Tithe Bay → Coupler Alcove → Ward Gallery → Scar Shaft → Extract Lock), remap secondary fire → relic-coupler + Cognitive Bleed, add ammo/tags/publish-vs-redact, replace placeholder art. Handoff notes live in the Game Project Context as `docs/ash-index-setup.md`.
