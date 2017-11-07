<%--
Knowage, Open Source Business Intelligence suite
Copyright (C) 2016 Engineering Ingegneria Informatica S.p.A.

Knowage is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

Knowage is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>


<%@ page language="java" pageEncoding="utf-8" session="true"%>


<%-- ---------------------------------------------------------------------- --%>
<%-- JAVA IMPORTS															--%>
<%-- ---------------------------------------------------------------------- --%>


<%@include file="/WEB-INF/jsp/commons/angular/angularResource.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="exportersCatalogueModule">
<head>
<%@include file="/WEB-INF/jsp/commons/angular/angularImport.jsp"%>


<link rel="stylesheet" type="text/css"    href="${pageContext.request.contextPath}/themes/commons/css/customStyle.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/src/angular_1.4/tools/catalogues/exportersCatalogue.js"></script>


</head>
<body class="bodyStyle" ng-controller="exportersCatalogueController as ctrl" >
    
   
    
	<angular-list-detail  show-detail="showMe">
		 	<list label='translate.load("sbi.exporters.title")' new-function="createExporters"> 	
			
               
               <angular-table  
				        flex
 						id="exportersList"
 						ng-model="myExporters" 
 						columns='[ 
 						         {"label":"Engine name","name":"engineLabel"}, 
 						         {"label":"Domain name","name":"domainLabel"} 
 						         ]'
 						highlights-selected-item=true
 						speed-menu-option='deleteIcon'
 						click-function="loadExporter(item)">						
 		      </angular-table>
 		    
 		   
 		    
	</list> 
	<detail label='(selectedExporter.exporterName==undefined)? "" : selectedExporter.exporterName'  save-function="saveExporter"
		cancel-function="cancel"
		disable-save-button="!exportersForm.$valid"
		show-save-button="showMe" show-cancel-button="showMe">
		<form name="exportersForm" ng-submit="exportersForm.$valid && saveExporter()" layout="column">
		   <md-input-container ng-show="showMe">
	         <md-select ng-model="selectedExporter.engineId" placeholder="Select an engine id">
	 		      <md-option required ng-value="engine.id" ng-repeat="engine in engines">{{engine.name}}</md-option>
	 		 </md-select>
	 		 <div ng-messages="exportersForm.engineId.$error" ng-show="!selectedExporter.engineId">
			      <div ng-message="required">{{translate.load("sbi.catalogues.generic.reqired")}}</div>
			 </div>
	 		 </md-input-container>
	 		 <md-input-container ng-show="showMe">
		 		 <md-select ng-model="selectedExporter.domainId" placeholder="Select a domain id">
		 		      <md-option required ng-value="domain.valueId" ng-repeat="domain in domains">{{domain.valueCd}}</md-option>
		 		 </md-select>
		 		 <div ng-messages="exportersForm.domainId.$error" ng-show="!selectedExporter.domainId">
			          <div ng-message="required">{{translate.load("sbi.catalogues.generic.reqired")}}</div>
			     </div>
	 		 </md-input-container>
		</form>		
	</detail>	
	</angular-list-detail>
</body>
</html>