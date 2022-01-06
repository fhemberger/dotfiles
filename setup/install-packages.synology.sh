if [ "$(echo "$PATH" | grep "/opt" -c)" -eq 0 ]; then
  export PATH="/opt/bin:/opt/sbin:$PATH"
fi

# Let Ansible detect opkg in `ansible_pkg_mgr`
# https://github.com/ansible/ansible/blob/devel/lib/ansible/module_utils/facts/system/pkg_mgr.py#L23
ln -s /opt/bin/opkg /bin/opkg

opkg update
opkg install \
  diffutils \
  less \
  ncdu \
  python3 \
  python3-pip \
  vim \
  wget \
  zsh

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
