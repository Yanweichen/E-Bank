	/**
	 * Created with JetBrains PhpStorm.
	 * User: kk
	 * Date: 13-8-28
	 * Time: 下午4:44
	 */
	function U() {
	    var url = arguments[0] || [];
	    var param = arguments[1] || {};
	    var url_arr = url.split('/');
	
	    if (!$.isArray(url_arr) || url_arr.length < 2 || url_arr.length > 3) {
	        return '';
	    }
	
	    if (url_arr.length == 2)
	        url_arr.unshift(_GROUP_);
	
	    var pre_arr = ['g', 'm', 'a'];
	
	    var arr = [];
	    for (d in pre_arr)
	        arr.push(pre_arr[d] + '=' + url_arr[d]);
	
	    for (d in param)
	        arr.push(d + '=' + param[d]);
	
	    return _APP_+'?'+arr.join('&');
	}
	
	 var isIE = /msie/i.test(navigator.userAgent) && !window.opera;  
	 function checkPicSize(target){ 
	    var fileSize = 0;          
	    if (isIE && !target.files) {      
	      var filePath = target.value;      
	      var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
	      var file = fileSystem.GetFile (filePath);      
	      fileSize = file.Size;     
	    } else {     
	     fileSize = target.files[0].size;      
	     }  
	     var size = fileSize /1024/1024;     
	     if(size>1){   
	      alert("附件不能大于1M");   
	      target.value=""
	     }   
	}
	
	

