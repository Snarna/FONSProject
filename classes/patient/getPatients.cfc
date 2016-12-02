<cfcomponent output="false">

    <cffunction name="countPatients" access="remote" returnformat="json" returntype="any">
        <!--- Get data from database --->
        <cfquery name="countQuery" datasource="emrdb">
            SELECT COUNT(*) AS patientNum FROM patientsData
        </cfquery>
        <cfreturn countQuery.patientNum>
    </cffunction>

    <cffunction name="getPatients" access="remote" returnformat="json" returntype="any">
        <cfargument name="startNum" type="numeric"required="yes">
        <cfset var response="">

        <cfquery name="patientQuery" datasource="emrdb">
            SELECT * FROM patientsData LIMIT #startNum# , 10
        </cfquery>

        <cfloop query="patientQuery">
            <cfset var response &="<tr>">
            <cfset var response &="<td>" & #patientid# & "</td><td>" & #pfname# & "</td><td>" & #plname# & "</td><td>" & #DateFormat(pdob, 'mm/dd/yyyy')# & "</td><td>N/A</td>">
        </cfloop>

        <cfreturn response>
    </cffunction>
</cfcomponent>
