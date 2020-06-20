#compdef diesel

autoload -U is-at-least

_diesel() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'--locked-schema[Require that the schema file is up to date]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
":: :_diesel_commands" \
"*::: :->diesel" \
&& ret=0
    case $state in
    (diesel)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:diesel-command-$line[1]:"
        case $line[1] in
            (migration)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
":: :_diesel__migration_commands" \
"*::: :->migration" \
&& ret=0
case $state in
    (migration)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:diesel-migration-command-$line[1]:"
        case $line[1] in
            (run)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(revert)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(redo)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(pending)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(generate)
_arguments "${_arguments_options[@]}" \
'--version=[The version number to use when generating the migration. Defaults to the current timestamp, which should suffice for most use cases.]' \
'--format=[The format of the migration to be generated.]: :(sql barrel)' \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'--locked-schema[Require that the schema file is up to date]' \
':MIGRATION_NAME -- The name of the migration to create:_files' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
        esac
    ;;
esac
;;
(setup)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(db)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
":: :_diesel__database_commands" \
"*::: :->database" \
&& ret=0
case $state in
    (database)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:diesel-database-command-$line[1]:"
        case $line[1] in
            (setup)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(drop)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
        esac
    ;;
esac
;;
(database)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
":: :_diesel__database_commands" \
"*::: :->database" \
&& ret=0
case $state in
    (database)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:diesel-database-command-$line[1]:"
        case $line[1] in
            (setup)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(drop)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'--migration-dir=[The location of your migration directory. By default this will look for a directory called `migrations` in the current directory and its parents.]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
        esac
    ;;
esac
;;
(bash-completion)
_arguments "${_arguments_options[@]}" \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
':SHELL:(zsh bash fish powershell elvish)' \
&& ret=0
;;
(print-schema)
_arguments "${_arguments_options[@]}" \
'-s+[The name of the schema.]' \
'--schema=[The name of the schema.]' \
'--patch-file=[A unified diff file to be applied to the final schema]' \
'*--import-types=[A list of types to import for every table, separated by commas]' \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'(-e --except-tables -b --blacklist)-o[Only include tables from table-name]' \
'(-e --except-tables -b --blacklist)--only-tables[Only include tables from table-name]' \
'(-b --blacklist -e --except-tables)-w[]' \
'(-b --blacklist -e --except-tables)--whitelist[]' \
'(-o --only-tables -w --whitelist)-e[Exclude tables from table-name]' \
'(-o --only-tables -w --whitelist)--except-tables[Exclude tables from table-name]' \
'(-w --whitelist -o --only-tables)-b[]' \
'(-w --whitelist -o --only-tables)--blacklist[]' \
'--with-docs[Render documentation comments for tables and columns]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
'::table-name -- Table names to filter (default only-tables if not empty):_files' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'--database-url=[Specifies the database URL to connect to. Falls back to the DATABASE_URL environment variable if unspecified.]' \
'--config-file=[The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE` environment variable if unspecified. Defaults to `diesel.toml` in your project root. See diesel.rs/guides/configuring-diesel-cli for documentation on this file.]' \
'-h[Prints help information]' \
'--help[Prints help information]' \
'-V[Prints version information]' \
'--version[Prints version information]' \
'--locked-schema[Require that the schema file is up to date]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_diesel_commands] )) ||
_diesel_commands() {
    local commands; commands=(
        "migration:A group of commands for generating, running, and reverting migrations." \
"setup:Creates the migrations directory, creates the database specified in your DATABASE_URL, and runs existing migrations." \
"database:A group of commands for setting up and resetting your database." \
"bash-completion:DEPRECATED: Generate bash completion script for the diesel command." \
"completions:Generate shell completion scripts for the diesel command." \
"print-schema:Print table definitions for database schema." \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'diesel commands' commands "$@"
}
(( $+functions[_diesel__bash-completion_commands] )) ||
_diesel__bash-completion_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel bash-completion commands' commands "$@"
}
(( $+functions[_diesel__completions_commands] )) ||
_diesel__completions_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel completions commands' commands "$@"
}
(( $+functions[_diesel__database_commands] )) ||
_diesel__database_commands() {
    local commands; commands=(
        "setup:Creates the database specified in your DATABASE_URL, and then runs any existing migrations." \
"reset:Resets your database by dropping the database specified in your DATABASE_URL and then running `diesel database setup`." \
"drop:Drops the database specified in your DATABASE_URL." \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'diesel database commands' commands "$@"
}
(( $+functions[_db_commands] )) ||
_db_commands() {
    local commands; commands=(
        "setup:Creates the database specified in your DATABASE_URL, and then runs any existing migrations." \
"reset:Resets your database by dropping the database specified in your DATABASE_URL and then running `diesel database setup`." \
"drop:Drops the database specified in your DATABASE_URL." \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'db commands' commands "$@"
}
(( $+functions[_diesel__database__drop_commands] )) ||
_diesel__database__drop_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel database drop commands' commands "$@"
}
(( $+functions[_diesel__migration__generate_commands] )) ||
_diesel__migration__generate_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration generate commands' commands "$@"
}
(( $+functions[_diesel__database__help_commands] )) ||
_diesel__database__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel database help commands' commands "$@"
}
(( $+functions[_diesel__help_commands] )) ||
_diesel__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel help commands' commands "$@"
}
(( $+functions[_diesel__migration__help_commands] )) ||
_diesel__migration__help_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration help commands' commands "$@"
}
(( $+functions[_diesel__migration__list_commands] )) ||
_diesel__migration__list_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration list commands' commands "$@"
}
(( $+functions[_diesel__migration_commands] )) ||
_diesel__migration_commands() {
    local commands; commands=(
        "run:Runs all pending migrations" \
"revert:Reverts the latest run migration" \
"redo:Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted." \
"list:Lists all available migrations, marking those that have been applied." \
"pending:Returns true if there are any pending migrations." \
"generate:Generate a new migration with the given name, and the current timestamp as the version" \
"help:Prints this message or the help of the given subcommand(s)" \
    )
    _describe -t commands 'diesel migration commands' commands "$@"
}
(( $+functions[_diesel__migration__pending_commands] )) ||
_diesel__migration__pending_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration pending commands' commands "$@"
}
(( $+functions[_diesel__print-schema_commands] )) ||
_diesel__print-schema_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel print-schema commands' commands "$@"
}
(( $+functions[_diesel__migration__redo_commands] )) ||
_diesel__migration__redo_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration redo commands' commands "$@"
}
(( $+functions[_diesel__database__reset_commands] )) ||
_diesel__database__reset_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel database reset commands' commands "$@"
}
(( $+functions[_diesel__migration__revert_commands] )) ||
_diesel__migration__revert_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration revert commands' commands "$@"
}
(( $+functions[_diesel__migration__run_commands] )) ||
_diesel__migration__run_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel migration run commands' commands "$@"
}
(( $+functions[_diesel__database__setup_commands] )) ||
_diesel__database__setup_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel database setup commands' commands "$@"
}
(( $+functions[_diesel__setup_commands] )) ||
_diesel__setup_commands() {
    local commands; commands=(
        
    )
    _describe -t commands 'diesel setup commands' commands "$@"
}

_diesel "$@"