PACKAGE := "net.emulicious.Emulicious"
BASE := "org.freedesktop"
BASE_VERSION := "25.08"
FLATHUB_REPO := "https://dl.flathub.org/repo/flathub.flatpakrepo"

setup:
  flatpak remote-add --if-not-exists --user flathub {{FLATHUB_REPO}}
  flatpak install {{BASE}}.Platform//{{BASE_VERSION}} {{BASE}}.Sdk//{{BASE_VERSION}} org.flatpak.Builder

build:
  flatpak-builder --force-clean --user --install-deps-from=flathub --repo=repo --install builddir {{PACKAGE}}.yml

bundle:
  mkdir -p dist
  flatpak build-bundle repo dist/emulicious.flatpak {{PACKAGE}} --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo

lint:
  flatpak run --command=flatpak-builder-lint org.flatpak.Builder appstream {{PACKAGE}}.metainfo.xml

run:
  flatpak run {{PACKAGE}}
