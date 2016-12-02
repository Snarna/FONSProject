<cfcomponent output="false">
    <cffunction name="searchPatients" access="remote" returnformat="json" returntype="any">
        <cfargument name="by" required="yes">
        <cfargument name="searchInput" required="yes">

        <cfif #by# EQ "id">
            <cfquery name="patientQuery" datasource="emrdb">
                SELECT * FROM patientsData WHERE patientid = '#searchInput#' OR pfname = '#searchInput#' OR plname = '#searchInput#'
            </cfquery>
        </cfif>
        <cfset var response=''>

        <cfif patientQuery.RecordCount EQ 0>
          <cfset response = "<tr><td colspan=5>Sorry. Cant find any patient with your search input</td></tr>">
        <cfelse>
            <cfloop query="patientQuery">
                <cfset var response &="<tr>">
                <cfset var response &="<td>" & #patientid# & "</td><td>" & #pfname# & "</td><td>" & #plname# & "</td><td>" & #pdob# & "</td><td>N/A</td>">
            </cfloop>
        </cfif>

        <cfreturn response>
    </cffunction>
</cfcomponent>
