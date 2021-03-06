Install Plasma GUI:
  pkg.group_installed:
    - name: plasma

Install DM:
  pkg.installed:
    - pkgs:
      - lightdm
      - lightdm-gtk-greeter
      - plasma-wayland-session

Make sure GDM is not starting automatically:
  service.disabled:
    - name: gdm

Set DM to start at startup:
  service.enabled:
    - name: lightdm


