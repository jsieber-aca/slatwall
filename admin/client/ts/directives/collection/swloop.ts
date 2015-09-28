angular.module('slatwalladmin').directive('swloop', function() {
  return {
	restrict: "E",
    transclude: 'element',
	scope: {
		index: "=",
		from: "@",
		to: "@"
	},
    link: function(scope, el, attrs, ctrl, transclude) {
	  console.log("Starting loop");
      var coll = scope.$eval(attrs.index);
	  var from = attrs.from || 0;
	  var to   = attrs.to;
	  var count = 0;	
	  console.log("Loop definition: ", coll, from, to, count);	  
      coll.forEach(function(each) {
		if (to > from || to > coll.length){ throw "index out of bounds!";}
		if (count < from){ 
			count++; 
			console.log("Loop count", count);
		}else{
			if (count >= to){
				console.log(count);
				transclude(function(transEl, transScope) {
				transScope.myEach = each;
				el.parent().append(transEl);
				});
				count++;
				return false;	
			}
			
		}
        
      });
    }
  };
});