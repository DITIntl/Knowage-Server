/*
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
 */
(function() {
	angular
		.module('cockpitModule')
		.controller('mapWidgetEditControllerFunction', MapWidgetEditControllerFunction)

	function MapWidgetEditControllerFunction(
			$scope,
			finishEdit,
			model,
			sbiModule_translate,
			$mdDialog,
			mdPanelRef,
			$mdToast,
			$timeout,
			cockpitModule_generalServices){
			
		$scope.translate=sbiModule_translate;
		$scope.newModel = angular.copy(model);
			
		//get templates location
	  	$scope.getTemplateUrl = function(template){
	  		return cockpitModule_generalServices.getTemplateUrl('mapWidget',template);
	  	}
	  	
	  	$scope.addLayer = function(ev) {
	  		$mdDialog.show({
				controller: function ($scope,$mdDialog) {
					
					$scope.add = function(){
						$mdDialog.hide();
					}
					$scope.cancel = function(){
						$mdDialog.cancel();
					}
				},
				scope: $scope,
				preserveScope:true,
		      templateUrl: $scope.getTemplateUrl('mapWidgetAddLayerDialog'),
		      targetEvent: ev,
		      clickOutsideToClose:true,
		      locals: {  }
		    })
		    .then(function() {});
	  	}
		$scope.saveConfiguration=function(){
			 mdPanelRef.close();
			 angular.copy($scope.newModel,model);
			 finishEdit.resolve();
 	  	}

		$scope.cancelConfiguration=function(){
 	  		mdPanelRef.close();
 	  		finishEdit.reject();
 	  	}
	}
})();