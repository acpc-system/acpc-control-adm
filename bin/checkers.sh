######################### Shell module contains function for different check operations

CONFFILES=("contesttitle")


## Function takes a file name, and return 0 if exists, 1 not exists, 2 not enough parameters
function isExist () {
	[ ${#} -ne 1 ] && return 2
	local FILENAME="${1}"
	[ ! -f ${FILENAME} ] && return 1
	return 0
}

## Function takes a file name, and return 0 if has a read permission, 1 not exists, 2 not enough parameters
function isRead () {
        [ ${#} -ne 1 ] && return 2
        local FILENAME="${1}"
        [ ! -r ${FILENAME} ] && return 1
        return 0
}

## Function takes a file name, and return 0 if has a write permission, 1 not exists, 2 not enough parameters
function isExist () {
        [ ${#} -ne 1 ] && return 2
        local FILENAME="${1}"
        [ ! -w ${FILENAME} ] && return 1
        return 0
}


## Function checks all config files (existance, read, and write operation)
## Returns
##	0: Success
##	1: Config file not exists
##	2: Config file has no read permission
##	3: Config file has no write permission
function checkConfigFiles() {
	#local -n MSG="${1}"
	#local -n CODE="${2}"
	CODE=0
	for FILE in ${CONFFILES}
	do
		FILENAME="${ETC}/${FILE}"
		isExist "${FILENAME}"
		[ ${?} -ne 0 ] && MSG="${FILENAME} is not exists" && CODE=1 && return ${CODE}
		isRead "${FILENAME}"
		[ ${?} -ne 0 ] && MSG="${FILENAME} is has no read permission" && CODE=2 && return ${CODE}
		isWrite "${FILENAME}"
                [ ${?} -ne 0 ] && MSG="${FILENAME} is has no write permission" && CODE=3 && return ${CODE}
	done
	return 0
}

