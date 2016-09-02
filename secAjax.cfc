<cfcomponent>
<cffunction name="updateMyInfoSettings" returntype="struct" access="remote" output="no">
	<cfset local.retSt = StructNew() />
	<cfset local.userId = createObject("security.model.user_authentication").getUserId() />
	<cfset local.processCall = TRUE />
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cftry>
		<cfif isDefined("ARGUMENTS.txt6")>
			<cfif len(trim(ARGUMENTS.txt6))>
				<cfquery name="local.chkEmailQry" datasource="#request.security.dsn#">
					SELECT	fieldvalue
					  FROM	USER_IDENTITY_VALUE UIV Join User_details UD On UIV.userid = UD.userid
					 WHERE	UIV.userid <> <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">
					   AND	UIV.fieldid = 6
					   AND  UD.isDeleted = 0
					   AND	LTrim(RTrim(UIV.fieldvalue)) = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(ARGUMENTS.txt6)#" />
				</cfquery>
				<cfif local.chkEmailQry.recordCount>
					<cfset local.retSt.returnCode = 0 />
					<cfset local.processCall = FALSE />
					<cfset local.retSt.EXECCLIENTSCRIPT = "alert(_gbl_jsItems['email_already_taken_portal']);" />
				</cfif>
			<cfelse>
				<cfset local.retSt.returnCode = 0 />
				<cfset local.processCall = FALSE />
				<cfset local.retSt.EXECCLIENTSCRIPT = "alert(_gbl_jsItems['valid_email_portal']);" />
			</cfif>
		</cfif>
		<cfif local.processCall>
			<cfif isDefined("arguments.columnLeftWidgets") OR isDefined("arguments.columnMidWidgets") OR isDefined("arguments.columnRightWidgets")>
				<cfset local.retSt = updateUserWidgets(local.userId,arguments.columnLeftWidgets,arguments.columnMidWidgets,arguments.columnRightWidgets) />
			</cfif>
			<cfif (local.retSt.returnCode EQ 1) AND isDefined("ARGUMENTS.raddefaultUOM")>
				<cfquery datasource="#request.security.dsn#">
					UPDATE USER_DETAILS 
					SET 
						defaultUOM = <cfqueryparam  cfsqltype="cf_sql_varchar" value="#left(trim(arguments.raddefaultUOM),1)#">
						<cfif isDefined("ARGUMENTS.secQuestion")>
							,SECQUESTION = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(arguments.secQuestion),256)#">
							,SECANSWER = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(arguments.secAnswere),256)#">
						</cfif> 
						<cfif isDefined("ARGUMENTS.userLandingPage") AND (val(arguments.userLandingPage) GT 0)>
							,LANDINGPAGEKEY = <cfqueryparam  cfsqltype="cf_sql_integer" value="#val(arguments.userLandingPage)#">						
						<cfelseif isDefined("ARGUMENTS.txtLandingPage") AND (val(arguments.txtLandingPage) GT 0)>
							,LANDINGPAGEKEY = <cfqueryparam  cfsqltype="cf_sql_integer" value="#val(arguments.txtLandingPage)#">
						</cfif>
					WHERE USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">
				</cfquery>
				<cfquery datasource="#request.security.dsn#">
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt1),256)#" /> WHERE FIELDID = 1 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt2),256)#" /> WHERE FIELDID = 2 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt3),256)#" /> WHERE FIELDID = 3 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt4),256)#" /> WHERE FIELDID = 4 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt5),256)#" /> WHERE FIELDID = 5 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					<cfif isDefined("ARGUMENTS.txt6") AND len(trim(ARGUMENTS.txt6))>
						UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt6),256)#" /> WHERE FIELDID=6 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					</cfif>
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt7),256)#" /> WHERE FIELDID = 7 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt8),256)#" /> WHERE FIELDID = 8 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt9),256)#" /> WHERE FIELDID = 9 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt10),256)#" /> WHERE FIELDID = 10 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt11),256)#" /> WHERE FIELDID = 11 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
					UPDATE USER_IDENTITY_VALUE SET FIELDVALUE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(ARGUMENTS.txt12),256)#" /> WHERE FIELDID = 12 AND USERID = <cfqueryparam cfsqltype="cf_sql_integer" value="#local.userId#">;
				</cfquery>
			</cfif>
		</cfif>
		<cfif local.retSt.returnCode>
			<cfset local.retSt.EXECCLIENTSCRIPT = "window.location.href = '/portal/index.cfm';" />
		</cfif>
		<cfcatch>
			<cfset local.retSt.returnCode = 0 />
			<cfset local.retSt.returnMessage = "Error: #CFCATCH.Message# - #CFCATCH.Detail#" />
		</cfcatch>
	</cftry>
	<cfset local.retSt.callFunct = "CBCOMMON" />
	
	<cfreturn local.retSt />
</cffunction>
<cffunction name="updateUserWidgets" returntype="struct" access="public" output="no">
	<cfargument name="userId" type="numeric" required="yes" />
	<cfargument name="columnLeftWidgets" type="string" required="no" default="" />
	<cfargument name="columnMidWidgets" type="string" required="no" default="" />
	<cfargument name="columnRightWidgets" type="string" required="no" default="" />
	<cfset local.retSt = StructNew() />
	<cftry>
		<cfquery name="local.chkMyLayoutQry" datasource="#request.edesk.dsn#">
			SELECT ml_id FROM my_layout WHERE layout_id=1 AND user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />
		</cfquery>
		<cfif local.chkMyLayoutQry.recordCount AND (val(local.chkMyLayoutQry.ml_id) GT 0)>
			<cfset local.myLayoutId = val(local.chkMyLayoutQry.ml_id) />
		<cfelse>
			<cfquery name="local.insQry" datasource="#request.edesk.dsn#">
				INSERT INTO my_layout(user_id,layout_id)
				OUTPUT INSERTED.ml_id
				VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />,1)
			</cfquery>
			<cfset local.myLayoutId = val(local.insQry.ml_id) />
		</cfif>
		<cftransaction>
		<cfquery datasource="#request.edesk.dsn#">
			DELETE
			  FROM	my_layout_columns
			 WHERE	mlc_id IN
					(
						SELECT	mlc.mlc_id
						  FROM	my_layout ml,
								my_layout_columns mlc
						 WHERE	ml.ml_id=mlc.ml_id
						   AND	user_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />
					)
		</cfquery>
		<cfquery name="local.myLayoutColumnQry" datasource="#request.edesk.dsn#">
			SELECT MAX(isNULL(mlc_id,0))+1 as max_MLCId FROM my_layout_columns
		</cfquery>
		<cfset local.nextMLCId = val(local.myLayoutColumnQry.max_MLCId) />
		<cfif len(trim(arguments.columnLeftWidgets)) OR len(trim(arguments.columnMidWidgets)) OR len(trim(arguments.columnRightWidgets))><!--- check that at-least one column has widget(s) --->
			<cfquery datasource="#request.edesk.dsn#">
				<cfloop list="#arguments.columnLeftWidgets#" index="local.arrElem">
					INSERT INTO	my_layout_columns (mlc_id,ml_id,layout_column_id,widget_id) VALUES (#local.nextMLCId#,#local.myLayoutId#,1,#listLast(local.arrElem,"_")#);
					<cfset local.nextMLCId = local.nextMLCId + 1 />
				</cfloop>
				<cfloop list="#arguments.columnMidWidgets#" index="local.arrElem">
					INSERT INTO	my_layout_columns (mlc_id,ml_id,layout_column_id,widget_id) VALUES (#local.nextMLCId#,#local.myLayoutId#,2,#listLast(local.arrElem,"_")#);
					<cfset local.nextMLCId = local.nextMLCId + 1 />
				</cfloop>
				<cfloop list="#arguments.columnRightWidgets#" index="local.arrElem">
					INSERT INTO	my_layout_columns (mlc_id,ml_id,layout_column_id,widget_id) VALUES (#local.nextMLCId#,#local.myLayoutId#,3,#listLast(local.arrElem,"_")#);
					<cfset local.nextMLCId = local.nextMLCId + 1 />
				</cfloop>
			</cfquery>
		</cfif><!--- END: at-least one column has widget(s) --->
		</cftransaction>	
		<cfset local.retSt.returnCode = 1 />
		<cfset local.retSt.returnMessage = "" />
		<cfcatch>
			<cfset local.retSt.returnCode = 0 />
			<cfset local.retSt.returnMessage = "Error: #CFCATCH.Message# - #CFCATCH.Detail#" />
		</cfcatch>
	</cftry>
	
	<cfreturn local.retSt />
</cffunction>
<cffunction name="resetMyPassword" returntype="struct" access="remote" output="no">
	<cfset local.retSt = StructNew() />
	<cfset local.cObj = createObject("security.model.user_authentication") />
	<cfset local.retSt = local.cObj.resetPassword(local.cObj.getCurrentUserId()) />
	<cfset local.retSt.callFunct = "CBresetMyPassword" />

	<cfreturn local.retSt />
</cffunction>
<cffunction name="assignCustomertoGroup" output="no" access="remote" returntype="struct">
	<cfargument name="groupid" type="numeric" required="Yes" />
	<cfargument name="inArr" type="array" required="yes" />
	<cfset local.retSt = StructNew() />			
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.EXECCLIENTSCRIPT = "" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cftry>
		<cftransaction>
		<cfquery datasource="#application.security.dsn#">
			DELETE FROM groupCustomers WHERE groupid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.groupId#" />
		</cfquery>
        <cfif val(arraylen(arguments.inArr))>
            <cfquery datasource="#application.security.dsn#">
                <cfloop  from="1" to="#arraylen(arguments.inArr)#" index="local.arrIdx">
                    INSERT INTO groupCustomers
                        (groupid,customernumber,instance,division)
                    VALUES
                        (#val(arguments.groupid)#,#val(arguments.inArr[local.arrIdx].customernumber)#,'#trim(arguments.inArr[local.arrIdx].instance)#','#trim(arguments.inArr[local.arrIdx].division)#');
                </cfloop>
            </cfquery>
        </cfif>
        <cfset generateSRALogs('Group',arguments.groupID,'null','Managed customers') />
		</cftransaction>
		<cfset local.retSt.returnCode = 1 />
		<cfset local.retSt.returnMessage = "Assigned customers to group." />
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# #cfcatch.Detail#" />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction> 
<cffunction name="assignGroupToUser" output="no" access="remote" returntype="struct">
	<cfargument name="userid" type="numeric" required="Yes" />
	<cfargument name="inArr" type="array" required="yes" />
	<cfset local.retSt = StructNew() />			
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = 0 />
	<cfset local.retSt.EXECCLIENTSCRIPT = "" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cftry>
		<cftransaction>
		<cfquery datasource="#application.security.dsn#">
			DELETE FROM userGroups WHERE userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />
		</cfquery>
        <cfif arraylen(arguments.inArr)>
            <cfquery datasource="#application.security.dsn#">
                <cfloop  from="1" to="#arraylen(arguments.inArr)#" index="local.arrIdx">
                    INSERT INTO userGroups
                        (userid,groupid)
                    VALUES
                        (#val(arguments.userid)#,#val(arguments.inArr[local.arrIdx].groupid)#);
                </cfloop>
            </cfquery>
             <cfset generateSRALogs('User','null',arguments.userid,'Managed groups') />
        </cfif>
		</cftransaction>
		<cfset local.retSt.returnCode = 1 />
		<cfset local.retSt.returnMessage = "Assigned groups to user." />
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction> 
<cffunction name="assignCustomerToUser" output="no" access="remote" returntype="struct">
	<cfargument name="userid" type="numeric" required="Yes" />
	<cfargument name="inArr" type="array" required="yes" />
	<cfset local.retSt = StructNew() />			
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.EXECCLIENTSCRIPT = "" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cftry>
		<cftransaction>
			 <cfquery datasource="#application.security.dsn#">
				DELETE FROM user_customer WHERE userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />
			</cfquery>
	        <cfif arraylen(arguments.inArr)>
				<cfquery datasource="#application.security.dsn#">
					<cfloop  from="1" to="#arraylen(arguments.inArr)#" index="local.arrIdx">
						INSERT INTO user_customer
							(userid,customerId,environment)
						VALUES
							(#val(arguments.userid)#,#val(arguments.inArr[local.arrIdx].customernumber)#,'#trim(arguments.inArr[local.arrIdx].instance)#');
					</cfloop>
				</cfquery>
			</cfif>
		</cftransaction>
		<cfset local.retSt.returnCode = 1 />
		<cfset local.retSt.returnMessage = "Assigned customers to user." />
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction> 
<cffunction name="assignInstoUser" output="no" access="remote" returntype="struct">
	<cfargument name="userid" type="numeric" required="Yes" />
	<cfargument name="inArr" type="array" required="yes" />
	<cfset local.retSt = StructNew() />			
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.EXECCLIENTSCRIPT = "" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cftry>
		<cftransaction>
		<cfquery datasource="#application.security.dsn#">
			DELETE FROM SRUserInstances WHERE userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />
		</cfquery>
        <cfif arraylen(arguments.inArr)>
            <cfquery datasource="#application.security.dsn#">
                <cfloop  from="1" to="#arraylen(arguments.inArr)#" index="local.arrIdx">
                    INSERT INTO SRUserInstances
                        (userid,brand,instance)
                    VALUES
                        (#val(arguments.userid)#,'#arguments.inArr[local.arrIdx].brand#','#arguments.inArr[local.arrIdx].instance#');
                </cfloop>
            </cfquery>
        </cfif>
		</cftransaction>
		<cfset local.retSt.returnCode = 1 />
		<cfset local.retSt.returnMessage = "Assigned instance[s] to user." />
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction>
<cffunction name="getExistingUserIns" output="no" access="remote" returntype="struct">
	<cfargument name="srchStr" type="string" required="Yes" />	
	<cfset local.retSt = StructNew() />			
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.CALLFUNCT = "GETEXISTUSERID" />
	<cfset local.retSt.searchUser = arguments.srchStr />
    <cfset local.qry = "" />
    <cfset local.qryTemplateId = "" />
    <cfset local.retSt.userID = "" />
	<cftry>
    	<cfquery   name="local.qryTemplateId"datasource="#application.security.dsn#">
        	SELECT configValue FROM configurationSettings WHERE configName=<cfqueryparam cfsqltype="cf_sql_varchar" value="SRTemplateId" />
        </cfquery>         
        <cfif val(local.qryTemplateId.recordCount)>
            <cfquery   name="local.qry"datasource="#application.security.dsn#">
                SELECT ut.tempid,ut.userID FROM  user_templates ut 
                INNER JOIN user_details ud ON ud.userid=ut.userid
                WHERE ud.loginname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.srchStr#" />
                AND ut.tempid in (#valuelist(local.qryTemplateId.configValue)#)
            </cfquery>
           
            <cfif val(local.qry.recordCount)>
                <cfset local.retSt.returnCode = 1 />
                <cfset local.retSt.userID =local.qry.userID />
            <cfelse>
                <cfset local.retSt.returnMessage = "User doesn't exists/No template assigned to user." />
            </cfif>       
        </cfif>
	<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction>
<cffunction name="generateSRALogs" access="public" returntype="void" output="false">
    <cfargument name="logtype" type="string" required="yes" />
    <cfargument name="groupId" type="string" required="No" default="" />
    <cfargument name="userId"  type="string"required="No" default="" />
    <cfargument name="activity" type="string" required="yes" />	   
    <cfset  local.qry = "" />   
    <cfset  local.currentUser = "" /> 	
    <cftry>   
    	<cfinvoke method="getUserDetails" component="security.model.user_authentication" returnvariable="local.currentUser">
            <cfinvokeargument name="userKey" value="UserName">
        </cfinvoke>       
        <cfquery name="local.qry" datasource="#application.security.dsn#">
        	<cfif arguments.groupId NEQ "null">
            INSERT INTO sralogs
                (logType,groupid,activity,addedby,logDate)
            VALUES
                (
                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.logtype#" />                    
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#val(arguments.groupId)#"  />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.activity#" />
                    ,'#local.currentUser#',getDate()
                )
            <cfelse>
            	 INSERT INTO sralogs
                (logType,userid,activity,addedby,logDate)
            VALUES
                (
                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.logtype#" />                    
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#val(arguments.userId)#"  />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.activity#" />
                    ,'#local.currentUser#'
		    ,getDate()	
                )
            </cfif>
        </cfquery>
        <cfcatch>
        </cfcatch>
    </cftry>   
</cffunction> 
<cffunction name="addDeleteUserRequest" access="remote" returntype="struct" output="no">
	<cfargument name="userId" type="numeric" required="yes" />
	<cfargument name="reason" type="string" required="yes" />
	<cfset local.retSt = StructNew() />
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.EXECCLIENTSCRIPT = "" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cftry>
		<cfquery name="local.checkUserQry" datasource="#request.security.dsn#">
			SELECT	ud.userId,ud.loginName,rd.status
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=1 AND uv.userId=ud.userId) AS firstName
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=2 AND uv.userId=ud.userId) AS lastName
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=3 AND uv.userId=ud.userId) AS phone
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=4 AND uv.userId=ud.userId) AS fax
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=5 AND uv.userId=ud.userId) AS company
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=6 AND uv.userId=ud.userId) AS email
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=7 AND uv.userId=ud.userId) AS add1
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=8 AND uv.userId=ud.userId) AS add2
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=9 AND uv.userId=ud.userId) AS city
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=10 AND uv.userId=ud.userId) AS state
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=11 AND uv.userId=ud.userId) AS zip
					,(select fieldvalue from USER_IDENTITY_VALUE (NOLOCK) uv WHERE uv.fieldId=12 AND uv.userId=ud.userId) AS country
			  FROM	user_details (NOLOCK) ud
					LEFT OUTER JOIN REQUEST_DETAILS rd (NOLOCK) ON ud.userid=rd.USERID AND isNULL(rd.status,4) NOT IN (2,3)
			 WHERE	ud.userId = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />
			   AND	isNULL(ud.isDeleted,0)=0
			   AND	ud.userType='E'
		</cfquery>
		<cfif local.checkUserQry.recordCount>
			<cfif val(local.checkUserQry.status) EQ 0>
				<cfinvoke method="getUserDetails" component="security.model.user_authentication" returnvariable="local.currentUser">
					<cfinvokeargument name="userKey" value="UserName">
				</cfinvoke>
				<cftransaction>
				<cfquery name="local.insQry" datasource="#application.security.dsn#">
					INSERT INTO request_details
						(requestType,status,userId,requestedBy,reason)
					VALUES
						('DELETE',1
							,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />
							,<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.currentUser#" />
							,<cfqueryparam cfsqltype="cf_sql_varchar" value="#left(trim(arguments.reason),2000)#" />
						);

					SELECT requestID = SCOPE_IDENTITY();
				</cfquery>
				<cfquery datasource="#application.security.dsn#">
					INSERT INTO request_users(requestID,userID,status,FirstName,LastName,Phone,Fax,Company,Email,AddressLine1,AddressLine2,City,State,ZipCode,country)
					values
					(
						<cfqueryparam cfsqltype="cf_sql_integer" value="#val(local.insQry.requestID)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.checkUserQry.loginName#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="Open">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.firstName)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.lastName)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.phone)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.fax)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.company)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.email)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.add1)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.add2)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.city)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.state)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.zip)#">
						,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(local.checkUserQry.country)#">
					);

					INSERT INTO sraLogs(logType,userId,requestId,activity,addedBy,logDate) VALUES ('Request',<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userId#" />,<cfqueryparam cfsqltype="cf_sql_integer" value="#val(local.insQry.requestID)#" />,'Delete request submitted',<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.currentUser#">,getDate())
				</cfquery>
				</cftransaction>
				<cfset local.retSt.returnCode = 1 />
				<cfset local.retSt.returnMessage = "Delete user request has been added." />
			<cfelse>
				<cfset local.retSt.returnMessage = "There is already an active request pending for this user!" />
			</cfif>
			<cfset local.retSt.EXECCLIENTSCRIPT = "unloadForm();" />
		<cfelse>
			<cfset local.retSt.returnMessage = "Invalid user!" />
		</cfif>
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction>
<cffunction name="doLogoffUser" returntype="struct" access="remote" output="no">
	<cfargument name="loginname" required="yes" type="string">
	<cfset local.retSt = StructNew() />
	<cfset local.retSt.returnCode = 0 />
	<cfset local.retSt.returnMessage = "" />
	<cfset local.retSt.EXECCLIENTSCRIPT = "reloadTrackingGrid();" />
	<cfset local.retSt.CALLFUNCT = "" />
	<cfset local.cObj = createObject("security.model.user_authentication") />
	<cftry>
		<cfif local.cObj.getCurrentUserId() NEQ arguments.loginname>
			<cfinvoke method="dologoff" component="security.model.user_authentication" returnvariable="local.rt">
				<cfinvokeargument name="loginname" value="#arguments.loginname#">
			</cfinvoke>
			<cfif local.rt.ReturnMessage EQ "Success">
				<cfset local.retSt.returnCode = 1 />
				<cfset local.retSt.returnMessage = "Logged-off user." />
			<cfelse>
				<cfset local.retSt.returnMessage = "Could not log-off user!" />
			</cfif>
		<cfelse>
			<cfset local.retSt.returnMessage = "Please use Logout button from the top to log yourself out!" />
		</cfif>
		<cfcatch>
			<cfset local.retSt.returnMessage = "An errro occurred! #cfcatch.Message# " />
		</cfcatch>
	</cftry>
	<cfreturn local.retSt />
</cffunction>
</cfcomponent>