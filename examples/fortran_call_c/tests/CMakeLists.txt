
###############################################
# Project Testing
###############################################
	SET (TEST_COLLECTION
		template
		fortran_call_c
		c_call_fortran
	)

	FOREACH (test ${TEST_COLLECTION})
		ADD_SUBDIRECTORY (${test})
	ENDFOREACH (test)
