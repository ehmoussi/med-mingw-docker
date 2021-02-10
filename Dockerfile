FROM archlinux/base

# Locale
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Update base system
RUN pacman-key --init && pacman-key --populate \
 && pacman -Syu --noconfirm --noprogressbar pacman \
 && pacman-db-upgrade \
 && pacman -Su --noconfirm --noprogressbar ca-certificates \
 && trust extract-compat \
 && pacman -Syyu --noconfirm --noprogressbar base-devel git sudo zip \
 && pacman -Scc --noconfirm
