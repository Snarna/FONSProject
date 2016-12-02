<cfcomponent output="false">

    <cffunction name="getPatientDetail" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
        <cfquery name="patientDetailQuery" datasource="emrdb">
            SELECT * FROM patientsData WHERE patientid = '#pid#'
        </cfquery>

        <cfset response = {
          "fname" = #patientDetailQuery.pfname#,
          "lname" = #patientDetailQuery.plname#,
          "dob" = #DateFormat(patientDetailQuery.pdob, "mm/dd/yyyy")#
          }>
        <cfreturn response>
    </cffunction>

    <cffunction name="getPatientSurveyNum" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
        <cfquery name="surveyCountQuery" datasource="emrdb">
            SELECT COUNT(*) AS surveyNum FROM surveyData WHERE patientid = '#pid#'
        </cfquery>
        <cfreturn surveyCountQuery.surveyNum>
    </cffunction>

</cfcomponent>
