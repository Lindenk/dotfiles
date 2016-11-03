#!/usr/bin/env bash

# =======================================
# Encrypt and decrypt files based on gpg
# =======================================
# 
# Howto:
# Create a file, for example test, inside the main directory.
# Now encrypt it using gpg (like 'gpg -o test.enc.gpg -r <IDENTITY> -e test')
# And run this script. 
# The script will find all files ending with .enc.gpg and tries to find it's decrypted file counterpart.
# If the decrypted file is not in the .gitignore file it will be added.
# Further changes to the decrypted file will automatically be transfered to the encrypted file.
# In case there is no decrypted version, the script will also decrypt it itself.
# If the encrypted file is newer than the decrypted one, it will decrypt again.

set -e
shopt -s globstar

# If no GPG ID available in ENV, take the first private identity that we have
[[ "${GPG_ID}" == '' ]] && GPG_ID=$(gpg -K 2>/dev/null | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" | head -n 1)

# If at this point we don't have a GPG identity, exit
[[ "${GPG_ID}" == '' ]] && exit 1

function decFile(){
  gpg -q -d "${1}" 2>/dev/null > "${2}"
}

function encFile(){
  #echo "[INFO] Encrypting \"${1}\" to \"${2}\""
  gpg -q -o "${2}" -r "${GPG_ID}" -e "${1}" 2>/dev/null
}

function ts2Str(){
  date -d @"${1}" +%Y%m%d%H%M.%S
}

for encName in **/*.enc.gpg; do
  [[ ! -f "${encName}" ]] && continue
  encModified=$(stat -c %Y "${encName}")
  decName="${encName%.enc.gpg}"
  if [[ ! -f "${decName}" ]]; then
    echo "[INFO] Decrypting \"${1}\" to \"${2}\""
    decFile "${encName}" "${decName}"
    touch -mt $(ts2Str ${encModified}) "${decName}"
  else
    decModified=$(stat -c %Y "${decName}")
    if [[ "${decModified}" -gt "${encModified}" ]]; then
      echo "[INFO] Decrypted file \"${decName}\" has changed."
      encFile "${decName}" "${encName}"
      touch -mt $(ts2Str ${decModified}) "${encName}"
    elif [[ "${encModified}" -gt "${decModified}" ]]; then
      echo "[INFO] Encrypted file \"${encName}\" has changed."
      decFile "${encName}" "${decName}"
      touch -mt $(ts2Str ${encModified}) "${decName}"
    fi
  fi
  if [[ ! $(git check-ignore "${decName}") ]]; then
    echo "[INFO] Ignoring \"${decName}\""
    echo -en "\n${decName}" >> '.gitignore'
  fi
done
