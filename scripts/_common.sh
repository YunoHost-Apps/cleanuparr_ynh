#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

install_apprise() {
    if [ ! -x "$data_dir/venv/bin/python" ]; then
        ynh_exec_as_app python3 -m venv "$data_dir/venv"
    fi

    ynh_hide_warnings ynh_exec_as_app "$data_dir/venv/bin/pip" install \
        --no-cache-dir --disable-pip-version-check "apprise==1.9.6"
}

set_base_path_for_service() {
    local service_file="/etc/systemd/system/$app.service"

    if [ "$path" = "/" ]; then
        ynh_replace \
            --match="^Environment=BASE_PATH=/$" \
            --replace="Environment=BASE_PATH=" \
            --file="$service_file"
    fi

    # Keep YunoHost's checksum in sync after normalizing the root path.
    ynh_store_file_checksum "$service_file"

    systemctl daemon-reload
}
