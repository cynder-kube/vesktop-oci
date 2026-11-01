# Vesktop OCI Image
The [Vesktop Client](https://github.com/Vencord/Vesktop) is an alternative client for Discord with loads of supported plugins and customizations. This project is a wrapper to bring you Vesktop as an OCI/Docker image inteded to be used with **Distrobox** for the best experience.

### How do I use this?
There's multiple ways to use this image, but I recommend using `distrobox assemble`.
- Get yourself the `distrobox.ini` or add the contents to your existing inventory.
- Deploy with `distrobox assemble create --replace -n vesktop <file>`. 
- Launch either via the terminal with `vesktop` or your startmenu.
  - I developed and tested this on KDE Plasma but it *should* work on other GUIs as well.
- The same deploy command can be used to update at any time.

### Features
From what I tested, everything should just work, even rich-resence. If you encounter any issues let me know.

### Why?
I was bored on a Sunday morning at 2AM and had my metal playlist running. 😅

### Copyright
All copyrights belong to [Discord](https://discord.com/) and the [Vencord Team](https://github.com/Vencord).
I do not own any of the application code and assets.