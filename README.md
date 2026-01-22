# Emulicious Flatpak

A fantastic multi-system emulator packaged up for distribution via Flatpak.

## Enabling VSCode integrations

First, you need create a symlink to the emulicious script file in the flatpak
exports. I suggest putting it in `~/.local/bin` but as long as it is in your
path and called `emulicious` it should work.

Then, you need to enable network capabilities for the `net.emulicious.Emulicious`
flatpak. This is used to communicate to VSCode's remote debug port.

Finally, if you are doing development outside of your home directory, you will
need to allow the flatpak to access that directory.

### CLI

```bash
# Create symlink
ln -s ~/.local/share/flatpak/exports/bin/net.emulicious.Emulicious ~/.local/bin/emulicious

# Enable networking
flatpak override net.emulicious.Emulicious --share=network

# Enable access to your development environment
flatpak override net.emulicious.Emulicious --filesystem=<path_here>
```

### Flatseal

![Toggle share network](./screenshots/flatseal-network.png)

![Add Other files](./screenshots/flatseal-filesystem.png)
