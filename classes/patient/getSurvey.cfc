<cfcomponent output="false">

    <cffunction name="getSurvey" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
      <cfargument name="surveyid" required="true"/>

        <cfquery name="sruveyQuery" datasource="emrdb">
            SELECT *
            FROM surveyData
            WHERE surveyid = '#pid#'
            AND patientid = '#surveyid#'
        </cfquery>

        <cfset response = {
          "q1a" = #sruveyQuery.question1#,
          "q2a" = #sruveyQuery.question2#,
          "q3a" = #sruveyQuery.question3#
          }>
        <cfreturn response>
    </cffunction>
</cfcomponent>
