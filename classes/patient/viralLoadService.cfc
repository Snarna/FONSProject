<cfcomponent>
	<!--- Component for CDC Data insert --->
	<cffunction name="insertVL" access="remote" returnformat="json" returntype="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfargument name="vlTest" type="numeric" required="true"/>
		<cfargument name="vlDate" type="date" required="true"/>
		<cfargument name="vlNotes" type="string" required="true"/>

		<!---Get the data from the form and insert them into database. --->
		<!--- Change the datasource name to match yours --->
		<cfquery name="vlInsertQuery" datasource="emrdb" result="result">
			INSERT INTO loadtestData
			(patientid, loadtestnum, loadtestnotes, loadtestdate)
			VALUES
			('#pid#', '#arguments.vlTest#', '#arguments.vlNotes#', <cfqueryparam cfsqltype="cf_sql_date" value="#vlDate#">)
		</cfquery>

		<cfset var newId=result.GENERATEDKEY>
		<cfreturn newId>
	</cffunction>

	<cffunction name="getVL" access="remote" returnformat="json" returnType="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfset var response="">

		<cfquery name="getViralLoadQuery" datasource="emrdb">
			SELECT *
			FROM loadtestData
			WHERE patientid = '#pid#'
		</cfquery>

		<cfloop query="getViralLoadQuery">
			<cfset var response &="<tr>">
			<cfset var response &="<td>" & #loadtestid# & "</td><td>" & #loadtestnum# & "</td><td>" & #loadtestdate# & "</td><td>" & #loadtestnotes# & "</td>">
		</cfloop>

		<cfreturn response>
	</cffunction>

</cfcomponent>
