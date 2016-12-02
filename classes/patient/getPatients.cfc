<cfcomponent output="false">

    <cffunction name="countPatients" access="remote" returnformat="json" returntype="any">
        <!--- Get data from database --->
        <cfquery name="countQuery" datasource="emrdb">
            SELECT COUNT(*) AS patientNum FROM patientsData
        </cfquery>
        <cfreturn countQuery.patientNum>
    </cffunction>

    <cffunction name="getPatients" access="remote" returnformat="json" returntype="any">
        <cfset var response="">

        <cfquery name="patientQuery" datasource="emrdb">
            SELECT * FROM patientsData
        </cfquery>

        <cfloop query="patientQuery">
            <cfset var response &="<tr>">
            <cfset var response &="<td>" & #patientid# & "</td><td>" & #pfname# & "</td><td>" & #plname# & "</td><td>" & #pdob# & "</td><td>N/A</td>">
        </cfloop>

        <cfreturn response>
    </cffunction>
</cfcomponent>
