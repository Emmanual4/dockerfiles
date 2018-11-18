
create_log_dir

# allow arguments to be passed to mysqld_safe
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == mysqld_safe || ${1} == $(which mysqld_safe) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch mysqld_safe
if [[ -z ${1} ]]; then
  listen "127.0.0.1"
  apply_configuration_fixes
  remove_debian_systen_maint_password
  initialize_mysql_database
  create_users_and_databases
  listen "0.0.0.0"
  exec $(which mysqld_safe) $EXTRA_ARGS
else
  exec "$@"
fi

