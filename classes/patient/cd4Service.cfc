<cfcomponent>
	<!--- Component for CDC Data insert --->
	<cffunction name="insertCD4" access="remote" returnformat="json" returntype="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfargument name="cd4Test" type="numeric" required="true"/>
		<cfargument name="cd4Date" type="date" required="true"/>
		<cfargument name="cd4Notes" type="string" required="true"/>

		<!---Get the data from the form and insert them into database. --->
		<!--- Change the datasource name to match yours --->
		<cfquery name="cd4InsertQuery" datasource="emrdb" result="result">
			INSERT INTO cd4testData
			(patientid, cd4testnum, cd4testnotes, cd4testdate)
			VALUES
			('#pid#', '#arguments.cd4Test#', '#arguments.cd4Notes#', <cfqueryparam cfsqltype="cf_sql_date" value="#cd4Date#">)
		</cfquery>

		<cfset var newId=result.GENERATEDKEY>
		<cfreturn newId>
	</cffunction>

	<cffunction name="getCD4" access="remote" returnformat="json" returnType="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfset var response="">

		<cfquery name="getCD4Query" datasource="emrdb">
			SELECT *
			FROM cd4testData
			WHERE patientid = #pid#
		</cfquery>

		<cfloop query="getCD4Query">
			<cfset var response &="<tr>">
			<cfset var response &="<td>" & #cd4testid# & "</td><td>" & #cd4testnum# & "</td><td>" & #cd4testdate# & "</td><td>" & #cd4testnotes# & "</td><td><button class='btn btn-xs' onclick='edit(this);'>Edit</button></td>">
		</cfloop>

		<cfreturn response>
	</cffunction>

	<cffunction name="editCD4" access="remote" returnformat="json" returnType="any">
		<cfargument name="newNum" type="numeric" required="true"/>
		<cfargument name="newNotes" type="string" required="true"/>
		<cfargument name="cd4Id" type="numeric" required="true"/>

		<cfquery name="editCD4Query" datasource="emrdb">
			UPDATE cd4testData
			SET cd4testnum = '#newNum#', cd4testnotes = '#newNotes#'
			WHERE cd4testid = '#cd4Id#'
		</cfquery>

	</cffunction>

</cfcomponent>
